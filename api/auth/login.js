const { getInstance, prepareQuery } = require('../../database')
const bcrypt = require('bcrypt')

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
                            descripgetInstancee: 'string'
                        },
                        password: { type: 'string' }
                    }
                },
                response: {
                    200: {
                        description: 'The user has logged in successfully',
                        type: 'object',
                        properties: {
                            token: { type: 'string' }
                        }
                    },
                    401: {
                        description: 'Wrong credentials were provided',
                        type: 'object',
                        properties: {
                            error: { type: 'string' }
                        }
                    },
                    404: {
                        description: "The user doesn't exist",
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
            const { username, password } = req.body
            const hashedPassword = await getUserPassword(username)

            if (!hashedPassword) {
                res.code(404).send({ error: "User doesn't exist" })
                return
            }

            if (!bcrypt.compareSync(password, hashedPassword)) {
                res.code(401).send({ error: 'Invalid password' })
                return
            }

            const query = prepareQuery(
                `SELECT token
                FROM User WHERE (username = ? OR email = ?) AND password = ?`,
                [username, username, hashedPassword]
            )

            const result = (await db.query(query))[0][0]

            if (result) {
                res.code(200).send({
                    token: result.token
                })
            }
        }
    )
}

async function getUserPassword(username) {
    const db = await getInstance()
    const query = prepareQuery(
        `SELECT password
        FROM User WHERE username = ? OR email = ?`,
        [username, username]
    )

    const result = (await db.query(query))[0][0]

    if (!result) return null

    return result.password
}
