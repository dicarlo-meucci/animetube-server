const Database = require('../../database')

module.exports = async function (fastify, options) {
    fastify.post(
        '/logout',
        {
            schema: {
                description: 'User registration',
                params: {
                    type: 'object',
                    properties: {
                        token: {
                            type: 'string',
                            description: 'the session token'
                        }
                    }
                },
                body: {
                    type: 'object',
                    properties: {
                        token: { type: 'string' }
                    }
                },
                response: {
                    200: {
                        description: 'Logged out successfully',
                        type: 'null',
                        properties: {}
                    },
                    403: {
                        description: 'Logout failed',
                        type: 'object',
                        properties: {
                            error: { type: 'string' }
                        }
                    }
                }
            }
        },
        async (req, res) => {
            let { token } = req.body
            try {
                let result = await Database.logout(token)
                res.send(result)
            } catch (error) {
                res.code(403).send({ error })
            }
        }
    )
}
