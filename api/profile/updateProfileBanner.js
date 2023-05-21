const { getInstance, prepareQuery } = require('../../database')

module.exports = async function (fastify, options) {
    fastify.patch('/banner',{
        schema: {
            description: 'Update user banner',
            body: {
                type: 'object',
                properties: {
                    banner: {
                        type: 'string',
                        description: 'The URL of the new banner image'
                    }
                },
                required: ['banner']
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
                    description: 'Banner updated successfully'
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
    }, async (req, res) => {
        const db = await getInstance()
        const token = req.headers['x-auth-token']
        const { banner } = req.body
        const query = prepareQuery(
            `UPDATE User SET banner = ? WHERE token = ?`,
            [banner, token]
        )
        const result = (await db.query(query))[0]

        if (!result.affectedRows) {
            res.code(401).send({ error: 'Invalid token' })
            return
        }

        res.code(200)
    })
}
