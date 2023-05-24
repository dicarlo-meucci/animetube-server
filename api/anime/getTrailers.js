const { getInstance, prepareQuery } = require('../../database')

module.exports = async function (fastify, options) {
    fastify.get('/trailers',{
        schema: {
            description: 'Get all trailers',
            response: {
                200: {
                    description: 'An array of trailer objects',
                    type: 'array',
                    items: {
                        type: 'object',
                        properties: {
                            link: { type: 'string' },
                            thumbnail: { type: 'string' }
                        }
                    }
                },
            }
        }
    }, async (req, res) => {
        const db = await getInstance()

        const result = (await db.query(`SELECT *
            FROM Trailer`))[0]

        res.code(200).send(result)
    })
}
