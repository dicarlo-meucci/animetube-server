const { getInstance, prepareQuery } = require('../../../database')

module.exports = async function (fastify, options)
{
    fastify.get('/', {
        schema: {
            description: 'Get the user list',
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
                    description: 'A list of anime objects',
                    type: 'array',
                    items: {
                        type: 'object',
                        properties: {
                            id: { type: 'integer' },
                            name: { type: 'string' },
                            description: { type: 'string' },
                            episodes: { type: 'integer' },
                            cover: { type: 'string' },
                            studio: {type: 'string' }
                        }
                    }
                },
                204: {
                    description: 'User list is empty',
                    type: 'null',
                },
                401: {
                    description: 'Invalid or missing authentication token',
                    type: 'object',
                    properties: {
                        error: { type: 'string' }
                    }
                }
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
            `SELECT a.*, e.episodes
            FROM Anime a
            JOIN (
                SELECT anime, COUNT(*) AS episodes
                FROM Episode
                GROUP BY anime
            ) e ON e.anime = a.id
            JOIN List l ON l.anime = a.id
            WHERE l.user = ?`,
            [user.id]
        )

        const result = (await db.query(query))[0]

        if (!result.length)
        {
            res.code(204).send({ error: 'Your list is empty' })
            return
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
