const { getInstance, prepareQuery } = require('../../database')

module.exports = async function (fastify, options)
{
    fastify.patch('/picture', {
        schema: {
            description: 'Update user profile picture',
            body: {
                type: 'object',
                properties: {
                    picture: {
                        type: 'string',
                        description: 'The URL of the new profile picture'
                    }
                },
                required: ['picture']
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
                    description: 'Profile picture updated successfully'
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
        const db = await getInstance()
        const token = req.headers['x-auth-token']
        const { picture } = req.body
        const query = prepareQuery(`UPDATE User SET pfp = ? WHERE token = ?`, [
            picture,
            token
        ])
        const result = (await db.query(query))[0]

        if (!result.affectedRows)
        {
            res.code(401).send({ error: 'Invalid token' })
            return
        }

        res.code(200)
    })
}
