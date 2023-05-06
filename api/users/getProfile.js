const { getInstance, prepareQuery } = require('../../database')

module.exports = async function (fastify, options) {
    fastify.get('/profile', async (req, res) => {
        const db = await getInstance()
        const token = req.headers['x-auth-token']
        const query = prepareQuery('SELECT * FROM User WHERE token = ?', [
            token
        ])
        const [rows] = await db.query(query)
        const result = rows[0]

        if (!result) {
            res.code(403).send({ error: 'Invalid token' })
            return
        }

        res.code(200).send(result)
    })
}
