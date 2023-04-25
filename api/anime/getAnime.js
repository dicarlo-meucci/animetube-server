const Database = require('../../database/index.js')

module.exports = async function (fastify, options) {
    fastify.get('/view/*', async (req, res) => {
        const id = req.params['*']
        res.send(await Database.getAnime(id)).code(200)
    })
}
