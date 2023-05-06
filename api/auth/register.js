const { getInstance, prepareQuery } = require('../../database')
const crypto = require('crypto')
const bcrypt = require('bcrypt')

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
                            token: { type: 'string' }
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
            const db = await getInstance()
            const { email, username, password } = req.body

            let checkQuery = prepareQuery(
                `SELECT email, username
                    FROM User WHERE username = ? OR email = ?`,
                [username, email]
            )

            const [rows] = await db.query(checkQuery)
            const checkResult = rows[0]

            if (checkResult) {
                res.code(403).send({error: 'User already exists'})
                return
            }

            const hashedPassword = bcrypt.hashSync(
                password,
                parseInt(process.env.SALT_ROUNDS)
            )

            const token = generateToken()

            const registerQuery = prepareQuery(
                `INSERT INTO User
                        VALUES (default, ?, ?, ?, ?, null, null)`,
                [username, email, hashedPassword, token]
            )
            
            await db.query(registerQuery)

            res.code(200).send({token})
        }
    )
}

function generateToken() {
    return crypto
        .randomBytes(parseInt(process.env.AUTH_TOKEN_LENGTH) / 2)
        .toString('hex')
}
