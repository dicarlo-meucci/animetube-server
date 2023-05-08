const { getInstance, prepareQuery } = require('../../database')

module.exports = async function (fastify, options) {
    fastify.get('/score/*', async (req, res) => {
        const db = await getInstance()
        const id = req.params['*']
        const query = prepareQuery(
            `SELECT ((SUM(score)/COUNT(*)) * 10) as score FROM Review WHERE anime = ?`,
            [id]
        )

        const result = (await db.query(query))[0]

        if (!result.score) {
            res.code(404).send({ error: 'No score was registered' })
            return
        }

        res.code(200).send(result)
    })
}
