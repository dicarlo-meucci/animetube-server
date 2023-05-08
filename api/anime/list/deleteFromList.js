const { getInstance, prepareQuery } = require('../../../database')

module.exports = async function (fastify, options) {
    fastify.post(
        '/remove',
        async (req, res) => {
            const db = await getInstance()

        }
    )
}
