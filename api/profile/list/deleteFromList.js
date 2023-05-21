const { getInstance, prepareQuery } = require('../../../database')

module.exports = async function (fastify, options) {
    fastify.delete('/',{
        schema: {
            description: 'Remove an anime from the user list',
            body: {
                type: 'object',
                properties: {
                    anime: {
                        type: 'integer',
                        description: 'The ID of the anime to remove from the list'
                    }
                },
                required: ['anime']
            },
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
                    type: 'object',
                    description: 'Anime removed from user list successfully'
                },
                401: {
                    description: 'Invalid or missing authentication token',
                    type: 'object',
                    properties: {
                        error: { type: 'string' }
                    }
                },
                403: {
                    description: 'Anime not in user list',
                    type: 'object',
                    properties: {
                        error: { type: 'string' }
                    }
                },
                500: {
                    description: 'Could not remove list',
                    type: 'object',
                    properties: {
                        error: { type: 'string' }
                    }
                }
            }
        }
    }, async (req, res) => {
        const db = await getInstance()
        const token = req.headers['x-auth-token']
        const { anime } = req.body
        const user = await getUser(token)

        if (!token) {
            res.code(401).send({ error: 'Authentication token not provided' })
            return
        }

        if (!user) {
            res.code(401).send({ error: 'Invalid token' })
            return
        }

        const checkIfExists = prepareQuery(
            'SELECT * FROM List WHERE anime = ? AND user = ?',
            [anime, user.id]
        )
        const exists = (await db.query(checkIfExists))[0][0]

        if (!exists) {
            res.code(403).send({
                error: 'This anime is not present in your list'
            })
            return
        }

        const query = prepareQuery(
            'DELETE FROM List WHERE anime = ? AND user = ?',
            [anime, user.id]
        )

        const result = (await db.execute(query))[0]

        if (result.affectedRows != 1) {
            res.code(500).send({ error: 'Could not remove list' })
            return
        }

        res.code(200)
    })
}

async function getUser(token) {
    const db = await getInstance()
    const query = prepareQuery('SELECT id FROM User WHERE token = ?', [token])
    const result = (await db.query(query))[0][0]
    return result
}
