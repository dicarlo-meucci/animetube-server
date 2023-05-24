const { getInstance, prepareQuery } = require('../../database')

module.exports = async function (fastify, options) {
    fastify.get('/:id/score',{
        schema: {
            description: 'Get the average score for an anime',
            params: {
                type: 'object',
                properties: {
                    id: {
                        type: 'integer',
                        description: 'The ID of the anime to get the score for'
                    }
                },
                required: ['id']
            },
            response: {
                200: {
                    description: 'The average score for the anime',
                    type: 'object',
                    properties: {
                        score: { type: 'number' }
                    }
                },
                204: {
                    description: 'No score was registered',
                    type: 'null',
                }
            }
        }
    }, async (req, res) => {
        const db = await getInstance()
        const anime = req.params['id']
        const query = prepareQuery(
            `SELECT ((SUM(score)/COUNT(*))) as score FROM Review WHERE anime = ?`,
            [anime]
        )

        const result = (await db.query(query))[0][0]

        if (!result.score) {
            res.code(204)
            return
        }

        res.code(200).send(result)
    })
}
