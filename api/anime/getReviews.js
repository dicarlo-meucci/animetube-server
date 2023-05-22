const { getInstance, prepareQuery } = require('../../database')

module.exports = async function (fastify, options) {
    fastify.get('/:id/reviews', async (req, res) => {
        const db = await getInstance()
        const anime = req.params['id']

        const query = prepareQuery(
        `SELECT u.username as user, r.text, r.score, r.date 
        FROM Review r
        INNER JOIN User u ON r.user = u.id
        INNER JOIN Anime a ON r.anime = a.id
        WHERE a.id = ?
        ORDER BY r.date DESC`,
            [anime]
        )

        const result = (await db.query(query))[0]

        if (!result.length) {
            res.code(204)
            return
        }

        res.code(200).send(result)
    })
}
