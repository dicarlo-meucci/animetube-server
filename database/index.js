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
        Database.connection.connect()
    }
    
}