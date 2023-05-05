const mysql = require('mysql2/promise')
const dotenv = require('dotenv')
const crypto = require('crypto')
const bcrypt = require('bcrypt')
dotenv.config()
const { DB_HOST, DB_USER, DB_PASSWORD, DB_NAME } = process.env

let instance = null

async function createInstance() {
    const db = mysql.createPool({
        host: DB_HOST,
        user: DB_USER,
        password: DB_PASSWORD,
        database: DB_NAME
    })

    this.instance = db

    return this.instance
}

async function getInstance() {
    return this.instance ?? (await createInstance())
}

function searchAnime(title) {
    return new Promise((resolve, reject) => {
        let query = prepareQuery(
            `SELECT * FROM Anime WHERE name LIKE ? LIMIT 5`,
            [`%${title}%`]
        )

        db.query(query, (err, res, fields) => {
            if (err) return reject(err)

            resolve(res)
        })
    })
}

function postReview(token, text, score, anime) {}

function updatePfp(token, link) {}

function getCarouselImages() {
    return new Promise((resolve, reject) => {
        let query = db.query(`SELECT trailer
            FROM Carousel`)

        db.query(query, (err, res, fields) => {
            if (err) return reject(err)

            resolve(res)
        })
    })
}

function findUserByToken(token) {
    return new Promise((resolve, reject) => {
        let query = prepareQuery(
            `SELECT *
            FROM User WHERE token = ?`,
            [token]
        )

        db.query(query, (err, res, fields) => {
            if (err) return reject(err)

            if (res.length != 0) {
                return resolve(res[0])
            }

            reject('Invalid token')
        })
    })
}

function getUserPassword(username) {
    return new Promise((resolve, reject) => {
        let query = prepareQuery(
            `SELECT password
            FROM User WHERE username = ? OR email = ?`,
            [username, username]
        )

        db.query(query, (err, res, fields) => {
            if (err) return reject(err)

            if (res.length != 0) {
                return resolve(res[0].password)
            }

            reject('User does not exist')
        })
    })
}

function logout(token) {
    return new Promise((resolve, reject) => {
        let query = prepareQuery(
            `SELECT token
            FROM User WHERE token = ?`,
            [token]
        )

        db.query(query, (err, res, fields) => {
            if (err) return reject(err)

            if (res.length != 0) {
                let newToken = generateToken()
                let query = prepareQuery(
                    `UPDATE User
                    SET token = ? WHERE token = ?`,
                    [newToken, token]
                )
                db.query(query, (err, res, fields) => {
                    if (err) return reject(err)

                    return resolve(res)
                })
            } else return reject('Invalid token')
        })
    })
}

function login(username, password) {
    return new Promise(async (resolve, reject) => {
        let hashedPassword

        try {
            hashedPassword = await this.getUserPassword(username)
        } catch (error) {
            return reject('User does not exist')
        }

        if (!bcrypt.compareSync(password, hashedPassword))
            return reject('Invalid password')

        let query = prepareQuery(
            `SELECT username, token
            FROM User WHERE (username = ? OR email = ?) AND password = ?`,
            [username, username, hashedPassword]
        )

        db.query(query, (err, res, fields) => {
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

function register(email, username, password) {
    return new Promise((resolve, reject) => {
        let check = prepareQuery(
            `SELECT email, username
            FROM User WHERE username = ? OR email = ?`,
            [username, email]
        )

        db.query(check, (err, res, fields) => {
            if (res.length != 0) {
                return reject('User already exists')
            }
            let hashedPassword = bcrypt.hashSync(
                password,
                parseInt(process.env.SALT_ROUNDS)
            )
            let token = generateToken()
            let query = prepareQuery(
                `INSERT INTO User
                VALUES (default, ?, ?, ?, ?, null, null)`,
                [username, email, hashedPassword, token]
            )
            db.query(query, (err, res, fields) => {
                if (err) return reject(err)
                resolve({ username, token })
            })
        })
    })
}

function getUserProfile(username) {
    return new Promise((resolve, reject) => {
        let query = prepareQuery(
            `SELECT *
            FROM User WHERE username = ?`,
            [username]
        )

        db.query(query, (err, res, fields) => {
            if (err) return reject(err)

            if (res.length != 0) {
                return resolve(res[0])
            }

            reject('User does not exist')
        })
    })
}

function generateToken() {
    return crypto
        .randomBytes(parseInt(process.env.AUTH_TOKEN_LENGTH) / 2)
        .toString('hex')
}

function prepareQuery(statement, params) {
    return mysql.format(statement, params)
}

module.exports = {
    getInstance,
    prepareQuery
}
