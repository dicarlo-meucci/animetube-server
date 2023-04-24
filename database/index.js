const mysql = require('mysql')
const dotenv = require('dotenv')
dotenv.config()
const { DB_HOST, DB_USER, DB_PASSWORD, DB_NAME } = process.env

module.exports = class Database
{
    static db = mysql.createConnection({
        host: DB_HOST,
        user: DB_USER,
        password: DB_PASSWORD,
        database: DB_NAME
    })

    constructor()
    {
        Database.db.connect()
    }

    static getAnimeList()
    {
        return new Promise((resolve, reject) =>
        {
            Database.db.query('SELECT * FROM Anime', (err, res, fields) =>
            {
                if (err) return reject(err)

                resolve(res)
            })
        })
    }

    static getAnime(name)
    {
        return new Promise((resolve, reject) =>
        {
            let query = Database.prepareQuery(`SELECT * FROM Anime WHERE nome = ?`, [name])
            Database.db.query(query, (err, res, fields) =>
            {
                if (err) return reject(err)

                resolve(res)
            })
        })
    }

    static postReview()
    {

    }

    static getAnimeScore()
    {

    }

    static getCarouselImages()
    {

    }

    static login(username, password)
    {
        return new Promise((resolve, reject) =>
        {
            let query = Database.prepareQuery(`SELECT username, email, psw
            FROM Utente WHERE (username = ? OR email = ?) AND psw = ?`,
                [username, username, password])

            Database.db.query(query, (err, res, fields) =>
            {
                if (err) return reject(err)

                resolve(res)
            })
        })
    }

    static register(email, username, password)
    {
        return new Promise((resolve, reject) =>
        {
            let statement = `INSERT INTO Utente
            VALUES (default, ?, ?, ?, 'abc')`
            let data = [username, email, password]
            let query = mysql.format(statement, data)
            console.log(query)
            Database.db.query(query, (err, res, fields) =>
            {
                if (err) return reject(err)

                resolve(res)
            })
        })
    }


    static prepareQuery(statement, params)
    {
        return mysql.format(statement, params)
    }
}
