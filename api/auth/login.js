const Database = require('../../database')

module.exports = async function (fastify, options) {
    fastify.post(
        '/login',
        {
            schema: {
                description: 'User login',
                params: {
                    type: 'object',
                    properties: {
                        username: {
                            type: 'string',
                            description: 'the username or email of the user'
                        },
                        password: {
                            type: 'string',
                            description: 'the password of the user'
                        }
                    }
                },
                body: {
                    type: 'object',
                    properties: {
                        username: { type: 'string' },
                        password: { type: 'string' }
                    }
                },
                response: {
                    200: {
                        description: 'The user has logged in successfully',
                        type: 'object',
                        properties: {
                            username: { type: 'string' },
                            token: { type: 'string' }
                        }
                    },
                    403: {
                        description: 'Wrong credentials were provided',
                        type: 'object',
                        properties: {
                            error: { type: 'string' }
                        }
                    }
                }
            }
        },
        async (req, res) => {
            let { username, password } = req.body
            try {
                let result = await Database.login(username, password)
                res.send(result)
            } catch (error) {
                res.code(403).send({ error })
            }
        }
    )
}
