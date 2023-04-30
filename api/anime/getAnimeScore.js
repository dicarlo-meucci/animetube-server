const Database = require('../../database/index.js')

module.exports = async function (fastify, options) {
    fastify.get('/score/*', async (req, res) => {
        const id = req.params['*']
        res.send(await Database.getAnimeScore(id)).code(200)
    })
}
