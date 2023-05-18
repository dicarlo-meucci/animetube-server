const { getInstance, prepareQuery } = require('../../database')

module.exports = async function (fastify, options) {
    fastify.get('/:id/score', async (req, res) => {
        const db = await getInstance()
        const anime = req.params['id']
        const query = prepareQuery(
            `SELECT ((SUM(score)/COUNT(*))) as score FROM Review WHERE anime = ?`,
            [anime]
        )

        const result = (await db.query(query))[0][0]

        if (!result.score) {
            res.code(204).send({ error: 'No score was registered' })
            return
        }

        res.code(200).send(result)
    })
}
