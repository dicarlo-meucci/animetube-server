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
                    404: {
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
                res.code(404).send({error: 'Invalid token'})
                return
            }
            
            const newToken = generateToken()

            const updateTokenQuery = prepareQuery(
                `UPDATE User
                SET token = ? WHERE token = ?`,
                [newToken, token]
            )

            await db.query(updateTokenQuery)

            res.send(200)
        }
    )
}

async function findUserByToken(token) {
    const query = prepareQuery(
        `SELECT *
        FROM User WHERE token = ?`,
        [token]
    )
    
    const [rows] = await db.query(query)
    
    if (!rows.length)
        return null

    return [rows[0]]
}

function generateToken() {
    return crypto
        .randomBytes(parseInt(process.env.AUTH_TOKEN_LENGTH) / 2)
        .toString('hex')
}
