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

function prepareQuery(statement, params) {
    return mysql.format(statement, params)
}

module.exports = {
    getInstance,
    prepareQuery
}
