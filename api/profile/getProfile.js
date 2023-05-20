const { getInstance, prepareQuery } = require('../../database')

module.exports = async function (fastify, options)
{
    fastify.get('/', {
        schema: {
            description: 'View user profile',
            params: {
                type: 'object',
                properties: {
                    
                }
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
                    description: 'User profile information',
                    type: 'object',
                    properties: {
                        username: { type: 'string' },
                        email: { type: 'string' },
                        banner: { type: 'string' },
                        pfp: { type: 'string' }
                    }
                },
                401: {
                    description: 'Invalid token',
                    type: 'object',
                    properties: {
                        error: { type: 'string' }
                    }
                }
            }
        }
    }, async (req, res) =>
    {
        const token = req.headers['x-auth-token']
        const result = await getUserInfo(token)

        if (!result)
        {
            res.code(401).send({ error: 'Invalid token' })
        }

        res.code(200).send(result)
    })
}

async function getUserInfo(token)
{
    const db = await getInstance()
    const query = prepareQuery(
        `SELECT username, email, banner, pfp
        FROM User WHERE token = ?`,
        [token]
    )

    const result = (await db.query(query))[0]

    if (!result.length) return null

    return result[0]
}
