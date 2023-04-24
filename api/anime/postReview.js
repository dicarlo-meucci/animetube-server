const Database = require('../../database/index.js')

module.exports = async function (fastify, options) {
    fastify.post('/review', async (req, res) => {
        console.log(req.body)
    })
}
