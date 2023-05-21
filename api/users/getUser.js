const { getInstance, prepareQuery } = require('../../database')

module.exports = async function (fastify, options) {
    fastify.get('/:username',{
        schema: {
            description: 'Get user profile',
            params: {
                type: 'object',
                properties: {
                    username: {
                        type: 'string',
                        description: 'The username of the user whose profile is being requested'
                    }
                },
                required: ['username']
            },
            response: {
                200: {
                    description: 'User profile',
                    type: 'object',
                    properties: {
                        username: { type: 'string' },
                        banner: { type: 'string' },
                        pfp: { type: 'string' }
                    }
                },
                404: {
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
        const query = prepareQuery(
            `SELECT username, banner, pfp FROM User WHERE username = ?`,
            [username]
        )
        const result = (await db.query(query))[0][0]
        if (!result) {
            res.code(404).send({ error: "User doesn't exist" })
            return
        }

        res.code(200).send(result)
    })
}
