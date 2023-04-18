const mysql = require('mysql');
const dotenv = require('dotenv')
dotenv.config()
const {DB_HOST, DB_USER, DB_PASSWORD, DB_NAME} = process.env

module.exports = class Database {
    static db = mysql.createConnection({
        host: DB_HOST,
        user: DB_USER,
        password: DB_PASSWORD,
        database: DB_NAME,
    })
    
    constructor() {
        Database.db.connect()
    }
    
    static getAnimeList() {
        return new Promise((resolve, reject) => {
            Database.db.query("SELECT * FROM anime", (err, res, fields) => {
                if (err)
                    return reject(err);

                resolve(res);
            })
        });
    }
    
    static login(username, password) {
        return new Promise((resolve, reject) => {
            let statement = `SELECT username, email, psw
            FROM Utente WHERE username = ? OR email = ? AND psw = ?`
            let data = [username, username, password]
            let query = mysql.format(statement, data)
            console.log(query)
            Database.db.query(query, (err, res, fields) => {
                if (err)
                    return reject(err);

                resolve(res);
            })
        });
    }
}

