const { getInstance, prepareQuery } = require('../../database')
const crypto = require('crypto')

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
                    401: {
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
            const db = await getInstance()
            const { token } = req.body
            const user = await findUserByToken(token)
            if (!user) {
                res.code(401).send({ error: 'Invalid token' })
                return
            }

            const newToken = generateToken()

            const updateTokenQuery = prepareQuery(
                `UPDATE User
                SET token = ? WHERE token = ?`,
                [newToken, token]
            )

            await db.query(updateTokenQuery)

            res.code(200)
        }
    )
}

async function findUserByToken(token) {
    const db = await getInstance()
    const query = prepareQuery(
        `SELECT *
        FROM User WHERE token = ?`,
        [token]
    )

    const result = (await db.query(query))[0]

    if (!result.length) return null

    return result[0]
}

function generateToken() {
    return crypto
        .randomBytes(parseInt(process.env.AUTH_TOKEN_LENGTH) / 2)
        .toString('hex')
}
