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
            let query = Database.prepareQuery(
                `SELECT * FROM Anime WHERE id = ?`,
                [id]
            )
            Database.db.query(query, (err, res, fields) => {
                if (err) return reject(err)

                resolve(res)
            })
        })
    }

    static searchAnime(title) {
        return new Promise((resolve, reject) => {
            let query = Database.prepareQuery(
                `SELECT * FROM Anime WHERE nome LIKE ? LIMIT 5`,
                [`%${title}%`]
            )
            
            Database.db.query(query, (err, res, fields) => {
                if (err) return reject(err)

                resolve(res)
            })
        })
    }

    static postReview() {}

    static getAnimeScore() {}

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
            FROM Utente WHERE token = ?`,
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
                `SELECT psw
            FROM Utente WHERE username = ?`,
                [username]
            )

            Database.db.query(query, (err, res, fields) => {
                if (err) return reject(err)

                if (res.length != 0) {
                    return resolve(res[0].psw)
                }

                reject('User does not exist')
            })
        })
    }

    static logout(token) {
        return new Promise((resolve, reject) => {
            let query = Database.prepareQuery(
                `SELECT token
            FROM Utente WHERE token = ?`,
                [token]
            )

            Database.db.query(query, (err, res, fields) => {
                if (err) return reject(err)

                if (res.length != 0) {
                    let newToken = Database.generateToken()
                    let query = Database.prepareQuery(
                        `UPDATE Utente
                    SET token = ? WHERE token = ?`,
                        [newToken, token]
                    )
                    Database.db.query(query, (err, res, fields) => {
                        if (err) return reject(err)

                        return resolve(res)
                    })
                }

                reject('Invalid token')
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
            FROM Utente WHERE (username = ? OR email = ?) AND psw = ?`,
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
            FROM Utente WHERE username = ? OR email = ?`,
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
                    `INSERT INTO Utente
                VALUES (default, ?, ?, ?, ?)`,
                    [username, email, hashedPassword, token]
                )

                Database.db.query(query, (err, res, fields) => {
                    if (err) return reject(err)

                    resolve({ token })
                })
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
