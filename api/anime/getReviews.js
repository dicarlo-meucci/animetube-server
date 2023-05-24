const { getInstance, prepareQuery } = require('../../database')

module.exports = async function (fastify, options) {
    fastify.get('/:id/reviews',{
        schema: {
            description: 'Get reviews for an anime',
            params: {
                type: 'object',
                properties: {
                    id: { type: 'integer', description: 'The ID of the anime' }
                }
            },
            response: {
                200: {
                    description: 'An array of review objects',
                    type: 'array',
                    items: {
                        type: 'object',
                        properties: {
                            user: { type: 'string' },
                            text: { type: 'string' },
                            score: { type: 'number' },
                            date: { type: 'string', format: 'date-time' }
                        }
                    }
                },
                204: {
                    description: 'No reviews found for the anime',
                    type: 'null',
                },
            }
        }
    }, async (req, res) => {
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
