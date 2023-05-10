const { getInstance, prepareQuery } = require('../../database')

module.exports = async function (fastify, options) {
    fastify.get('/tokens', async (req, res) => {
        const db = await getInstance()
        const token = req.headers['x-auth-token']

        if (!token) {
            res.code(401).send({ error: 'Authentication token not provided' })
            return
        }

        if (token == 'dev')
            res.send((await db.query('SELECT token FROM User'))[0])
        else res.code(401)
    })
}
