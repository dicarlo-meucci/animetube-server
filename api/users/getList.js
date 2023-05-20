const { getInstance, prepareQuery } = require('../../database')

module.exports = async function (fastify, options) {
    fastify.get('/:username/list',{
        schema: {
            description: 'Get user anime list',
            params: {
                type: 'object',
                properties: {
                    username: {
                        type: 'string',
                        description: 'The username of the user whose list is being requested'
                    }
                },
                required: ['username']
            },
            response: {
                200: {
                    description: 'User anime list',
                    type: 'object',
                    properties: {
                        id: { type: 'integer' },
                        name: { type: 'string' },
                        studio: { type: 'string' },
                        date: { type: 'string' },
                        description: { type: 'string' },
                        cover: { type: 'string' },
                        episodes: { type: 'integer' }
                    }
                },
                204: {
                    description: 'User list is empty',
                    type: 'object',
                    properties: {
                        error: { type: 'string' }
                    }
                },
                401: {
                    description: "User doesn't exist",
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
            'SELECT DISTINCT a.*, COUNT(e.id) AS episodes FROM List l JOIN Anime a ON (l.anime = a.id) JOIN Episode e ON (e.anime = a.id) WHERE l.user = ?',
            [user.id]
        )

        const result = (await db.query(query))[0][0]
        console.log(result)
        if (!result.length) {
            res.code(204).send({ error: 'Your list is empty' })
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
