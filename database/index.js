const mysql = require('mysql2/promise')
const dotenv = require('dotenv')
dotenv.config()

const { DB_HOST, DB_USER, DB_PASSWORD, DB_NAME } = process.env

let instance = null

async function createInstance() {
    const db = mysql.createConnection({
        host: DB_HOST,
        user: DB_USER,
        password: DB_PASSWORD,
        database: DB_NAME
    })

    this.instance = await db

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

function prepareQuery(statement, params) {
    return mysql.format(statement, params)
}

module.exports = {
    getInstance,
    prepareQuery
}
