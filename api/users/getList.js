const { getInstance, prepareQuery } = require('../../database')

module.exports = async function (fastify, options) {
    fastify.get('/:username/list',{
        schema: {
            description: 'Get the anime list of a user',
            params: {
                type: 'object',
                properties: {
                    username: { type: 'string', description: 'The username of the user' }
                }
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
                            studio: { type: 'string' }
                        }
                    }
                },
                204: {
                    description: 'User list is empty',
                    type: 'null',
                },
                401: {
                    description: 'The specified user does not exist',
                    type: 'object',
                    properties: {
                        error: { type: 'string' }
                    }
                }
            }
        }
    }, async (req, res) => {
        const db = await getInstance()
        const username = req.params['username']
        const user = await getUser(username)

        if (!user) {
            res.code(401).send({ error: "User doesn't exist" })
            return
        }

        const query = prepareQuery(
            `SELECT DISTINCT a.*, COUNT(e.id) AS episodes
            FROM List l JOIN Anime a ON (l.anime = a.id)
            JOIN Episode e ON (e.anime = a.id)
            WHERE l.user = ?
            GROUP BY a.id`,
            [user.id]
        )

        const result = (await db.query(query))[0]

        if (!result.length) {
            res.code(204)
            return
        }

        res.code(200).send(result)
    })
}

async function getUser(username) {
    const db = await getInstance()
    const query = prepareQuery('SELECT * FROM User WHERE username = ?', [
        username
    ])
    const result = (await db.query(query))[0][0]
    return result
}
