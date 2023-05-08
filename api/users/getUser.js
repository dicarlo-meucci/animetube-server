const { getInstance, prepareQuery } = require('../../database')

module.exports = async function (fastify, options) {
    fastify.get('/user/*', async (req, res) => {
        const db = await getInstance()
        const token = req.headers['x-auth-token']
        const { user } = req.body
    })
}

// let query = prepareQuery(
//     `SELECT *
//     FROM User WHERE username = ?`,
//     [username]
// )

// db.query(query, (err, res, fields) => {
//     if (err) return reject(err)

//     if (res.length != 0) {
//         return resolve(res[0])
//     }

//     reject('User does not exist')
// })