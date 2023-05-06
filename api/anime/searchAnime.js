const { getInstance, prepareQuery } = require('../../database')

module.exports = async function (fastify, options) {
    fastify.post('/search', async (req, res) => {
        const { title } = req.body
        res.send(await Database.searchAnime(title)).code(200)
    })
}
