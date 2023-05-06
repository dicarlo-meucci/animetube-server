const { getInstance, prepareQuery } = require('../../database')

module.exports = async function (fastify, options) {
    fastify.get(
        '/view/*',
        {
            schema: {
                description: 'get the details of a specific anime',
                params: {
                    type: 'object',
                    properties: {
                        id: {
                            type: 'number',
                            description: 'the id of the anime'
                        }
                    }
                },
                response: {
                    200: {
                        description: 'anime object',
                        type: 'object',
                        properties: {
                            id: { type: 'number' },
                            name: { type: 'string' },
                            studio: { type: 'string' },
                            description: { type: 'string' },
                            date: { type: 'string' },
                            cover: { type: 'string' },
                            episodes: {
                                type: 'array',
                                items: {
                                    type: 'object',
                                    properties: {
                                        link: { type: 'string' }
                                    }
                                }
                            }
                        }
                    },
                    404: {
                        description: 'anime does not exist',
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
            const id = req.params['*']
            const query = prepareQuery(`SELECT * FROM Anime WHERE id = ?`, [id])
            const [rows] = await db.query(query)
            const result = rows[0]

            if (!result) {
                res.code(404).send({ error: "Anime doesn't exist" })
                return
            }

            res.code(200).send(result)
        }
    )
}
