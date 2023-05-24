const { getInstance, prepareQuery } = require('../../../database')

module.exports = async function (fastify, options)
{
    fastify.get('/',{
        schema: {
            description: 'Get the reviews of the authenticated user',
            headers: {
                type: 'object',
                properties: {
                    'x-auth-token': {
                        type: 'string',
                        description: 'The authentication token of the user'
                    }
                },
                required: ['x-auth-token']
            },
            response: {
                200: {
                    description: 'An array of review objects',
                    type: 'array',
                    items: {
                        type: 'object',
                        properties: {
                            anime: {
                                type: 'object',
                                properties: {
                                    id: { type: 'integer' },
                                    name: { type: 'string' }
                                }
                            },
                            text: { type: 'string' },
                            score: { type: 'number' },
                            date: { type: 'string', format: 'date-time' }
                        }
                    }
                },
                204: {
                    description: 'No reviews found for the user',
                    type: 'null',
                },
                401: {
                    description: 'Invalid or missing authentication token',
                    type: 'object',
                    properties: {
                        error: { type: 'string' }
                    }
                },
            }
        }
    }, async (req, res) =>
    {
        const db = await getInstance()
        const token = req.headers['x-auth-token']

        if (!token)
        {
            res.code(401).send({ error: 'Authentication token not provided' })
            return
        }

        const user = await getUser(token)

        if (!user)
        {
            res.code(401).send({ error: 'Invalid token' })
            return
        }

        const query = prepareQuery(
            `SELECT a.name as animeName, a.id as animeId, r.text, r.score, r.date 
            FROM Review r
            INNER JOIN User u ON r.user = u.id
            INNER JOIN Anime a ON r.anime = a.id
            WHERE u.id = ?
            ORDER BY r.date DESC`,
            [user.id]
        )

        const result = (await db.execute(query))[0]
        
        if (!result.length) {
            res.code(204)
            return
        }

        for (const review of result)
        {
            review.anime = {
                id: review.animeId,
                name: review.animeName,
            }

            delete review.animeId
            delete review.animeName
        }

        res.code(200).send(result)
    })
}

async function getUser(token)
{
    const db = await getInstance()
    const query = prepareQuery('SELECT id FROM User WHERE token = ?', [token])
    const result = (await db.query(query))[0][0]
    return result
}
