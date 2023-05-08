const { getInstance, prepareQuery } = require('../../database')

module.exports = async function (fastify, options) {
    fastify.post('/search', async (req, res) => {
        const db = await getInstance()
        const { title } = req.body
        let query = prepareQuery(
            `SELECT * FROM Anime WHERE name LIKE ? LIMIT 5`,
            [`%${title}%`]
        )

        const result = (await db.query(query))[0]

        res.send(result)
    })
}
