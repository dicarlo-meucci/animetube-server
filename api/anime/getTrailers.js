const { getInstance, prepareQuery } = require('../../database')

module.exports = async function (fastify, options) {
    fastify.get('/trailers', async (req, res) => {
        const db = await getInstance()

        const result = (await db.query(`SELECT *
            FROM Trailer`))[0]

        res.code(200).send(result)
    })
}
