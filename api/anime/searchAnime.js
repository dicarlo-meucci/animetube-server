const Database = require('../../database/index.js')

module.exports = async function (fastify, options) {
    fastify.post('/search', async (req, res) => {
        const {title} = req.body
        res.send(await Database.searchAnime(title)).code(200)
    })
}
