const { getInstance, prepareQuery } = require('../../database')

module.exports = async function (fastify, options) {
    fastify.get('/user/*', async (req, res) => {
        const db = await getInstance()
        const token = req.headers['x-auth-token']
        const { user } = req.body
    })
}
