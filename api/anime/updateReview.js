const { getInstance, prepareQuery } = require('../../database')

module.exports = async function (fastify, options) {
    fastify.patch('/review', async (req, res) => {
        const db = await getInstance()
        const token = req.headers['x-auth-token']
        const {anime, review, text, score} = req.body
        

    })
}
