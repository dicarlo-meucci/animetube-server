const { getInstance, prepareQuery } = require('../../database')

module.exports = async function (fastify, options) {
    fastify.get(
        '/list',
        {
            schema: {
                description: 'get a list of all the anime',
                response: {
                    200: {
                        description: 'anime list',
                        type: 'array',
                        items: {
                            type: 'object',
                            properties: {
                                id: { type: 'number' },
                                name: { type: 'string' },
                                date: { type: 'string' },
                                cover: { type: 'string' }
                            }
                        }
                    }
                }
            }
        },
        async (req, res) => {
            const db = await getInstance()
            const [rows] = await db.query('SELECT * FROM Anime')

            if (rows.length == 0) {
                res.code(404).send({ error: 'No anime is available' })
                return
            }

            res.code(200).send(rows)
        }
    )
}
