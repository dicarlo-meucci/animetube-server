const Database = require('../../database')

module.exports = async function (fastify, options) {
    fastify.post(
        '/register',
        {
            schema: {
                description: 'User registration',
                params: {
                    type: 'object',
                    properties: {
                        email: {
                            type: 'string',
                            description: 'the email of the user'
                        },
                        username: {
                            type: 'string',
                            description: 'the username of the user'
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
                        email: { type: 'string', format: 'email' },
                        username: { type: 'string' },
                        password: { type: 'string' }
                    }
                },
                response: {
                    200: {
                        description: 'User registered successfully',
                        type: 'object',
                        properties: {
                            username: { type: 'string' }
                        }
                    },
                    403: {
                        description: 'Registration failed',
                        type: 'object',
                        properties: {
                            error: { type: 'string' }
                        }
                    }
                }
            }
        },
        async (req, res) => {
            let { email, username, password } = req.body
            try {
                let result = await Database.register(email, username, password)
                res.code(200).send(result)
            } catch (error) {
                res.code(403).send({ error })
            }
        }
    )
}
