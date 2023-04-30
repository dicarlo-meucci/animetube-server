const mysql = require('mysql')
const dotenv = require('dotenv')
const crypto = require('crypto')
const bcrypt = require('bcrypt')
dotenv.config()
const { DB_HOST, DB_USER, DB_PASSWORD, DB_NAME } = process.env

module.exports = class Database {
    static db = mysql.createConnection({
        host: DB_HOST,
        user: DB_USER,
        password: DB_PASSWORD,
        database: DB_NAME
    })

    constructor() {
        Database.db.connect()
    }

    static getAnimeList() {
        return new Promise((resolve, reject) => {
            Database.db.query('SELECT * FROM Anime', (err, res, fields) => {
                if (err) return reject(err)

                resolve(res)
            })
        })
    }

    static getAnime(id) {
        return new Promise((resolve, reject) => {
            let animeQuery = Database.prepareQuery(
                `SELECT * FROM Anime WHERE id = ?`,
                [id]
            )

            Database.db.query(animeQuery, (err, animeRes, fields) => {
                if (err) return reject(err)

                let episodesQuery = Database.prepareQuery(
                    `SELECT link FROM Episode WHERE anime = ?`,
                    [animeRes[0].id]
                )

                Database.db.query(episodesQuery, (err, episodesRes, fields) => {
                    if (err) return reject(err)

                    let anime = animeRes[0]
                    anime.episodes = episodesRes
                    resolve(anime)
                })
            })
        })
    }

    static getAnimeScore(id) {
        return new Promise((resolve, reject) => {
            let query = Database.prepareQuery(
                `SELECT ((SUM(score)/COUNT(*)) * 10) as score FROM Review WHERE anime = ?`,
                [id]
            )

            Database.db.query(query, (err, res, fields) => {
                if (err) return reject(err)

                return resolve(res[0])
            })
        })
    }

    static searchAnime(title) {
        return new Promise((resolve, reject) => {
            let query = Database.prepareQuery(
                `SELECT * FROM Anime WHERE name LIKE ? LIMIT 5`,
                [`%${title}%`]
            )

            Database.db.query(query, (err, res, fields) => {
                if (err) return reject(err)

                resolve(res)
            })
        })
    }

    static postReview() {}

    static getCarouselImages() {
        return new Promise((resolve, reject) => {
            let query = Database.db.query(`SELECT trailer
            FROM Carousel`)

            Database.db.query(query, (err, res, fields) => {
                if (err) return reject(err)

                resolve(res)
            })
        })
    }

    static findUserByToken(token) {
        return new Promise((resolve, reject) => {
            let query = Database.prepareQuery(
                `SELECT *
            FROM User WHERE token = ?`,
                [token]
            )

            Database.db.query(query, (err, res, fields) => {
                if (err) return reject(err)

                if (res.length != 0) {
                    return resolve(res[0])
                }

                reject('Invalid token')
            })
        })
    }

    static getUserPassword(username) {
        return new Promise((resolve, reject) => {
            let query = Database.prepareQuery(
                `SELECT password
            FROM User WHERE username = ? OR email = ?`,
                [username, username]
            )

            Database.db.query(query, (err, res, fields) => {
                if (err) return reject(err)

                if (res.length != 0) {
                    return resolve(res[0].password)
                }

                reject('User does not exist')
            })
        })
    }

    static logout(token) {
        return new Promise((resolve, reject) => {
            let query = Database.prepareQuery(
                `SELECT token
            FROM User WHERE token = ?`,
                [token]
            )

            Database.db.query(query, (err, res, fields) => {
                if (err) return reject(err)

                if (res.length != 0) {
                    let newToken = Database.generateToken()
                    let query = Database.prepareQuery(
                        `UPDATE User
                    SET token = ? WHERE token = ?`,
                        [newToken, token]
                    )
                    Database.db.query(query, (err, res, fields) => {
                        if (err) return reject(err)

                        return resolve(res)
                    })
                } else return reject('Invalid token')
            })
        })
    }

    static login(username, password) {
        return new Promise(async (resolve, reject) => {
            let hashedPassword

            try {
                hashedPassword = await this.getUserPassword(username)
            } catch (error) {
                return reject('User does not exist')
            }

            if (!bcrypt.compareSync(password, hashedPassword))
                return reject('Invalid password')

            let query = Database.prepareQuery(
                `SELECT username, token
            FROM User WHERE (username = ? OR email = ?) AND password = ?`,
                [username, username, hashedPassword]
            )

            Database.db.query(query, (err, res, fields) => {
                if (err) return reject(err)

                if (res.length != 0) {
                    return resolve({
                        username: res[0].username,
                        token: res[0].token
                    })
                }
            })
        })
    }

    static register(email, username, password) {
        return new Promise((resolve, reject) => {
            let check = Database.prepareQuery(
                `SELECT email, username
            FROM User WHERE username = ? OR email = ?`,
                [username, email]
            )

            Database.db.query(check, (err, res, fields) => {
                if (res.length != 0) {
                    return reject('User already exists')
                }
                let hashedPassword = bcrypt.hashSync(
                    password,
                    parseInt(process.env.SALT_ROUNDS)
                )
                let token = Database.generateToken()
                let query = Database.prepareQuery(
                    `INSERT INTO User
                VALUES (default, ?, ?, ?, ?, null, null)`,
                    [username, email, hashedPassword, token]
                )
                Database.db.query(query, (err, res, fields) => {
                    if (err) return reject(err)
                    resolve({ username, token })
                })
            })
        })
    }

    static getUserProfile(username) {
        return new Promise((resolve, reject) => {
            let query = Database.prepareQuery(
                `SELECT *
            FROM User WHERE username = ?`,
                [username]
            )

            Database.db.query(query, (err, res, fields) => {
                if (err) return reject(err)

                if (res.length != 0) {
                    return resolve(res[0])
                }

                reject('User does not exist')
            })
        })
    }

    static generateToken() {
        return crypto
            .randomBytes(parseInt(process.env.AUTH_TOKEN_LENGTH) / 2)
            .toString('hex')
    }

    static prepareQuery(statement, params) {
        return mysql.format(statement, params)
    }
}
