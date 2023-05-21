const { getInstance, prepareQuery } = require('../../database')

module.exports = async function (fastify, options) {
    fastify.post('/search',{
        schema: {
            description: 'Search for anime by title',
            body: {
                type: 'object',
                properties: {
                    title: {
                        type: 'string',
                        description: 'The title of the anime to search for'
                    }
                },
                required: ['title']
            },
            response: {
                200: {
                    description: 'A list of anime objects',
                    type: 'array',
                    items: {
                        type: 'object',
                        properties: {
                            id: { type: 'integer' },
                            title: { type: 'string' },
                            description: { type: 'string' },
                            episodes: { type: 'integer' },
                            cover: { type: 'string' }
                        }
                    }
                }
            }
        }
    }, async (req, res) => {
        const db = await getInstance()
        const { title } = req.body
        const query = prepareQuery(
            `SELECT * FROM Anime WHERE name LIKE ? LIMIT 5`,
            [`%${title}%`]
        )
        const result = (await db.query(query))[0]

        res.send(result)
    })
}
