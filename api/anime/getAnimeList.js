const { getInstance, prepareQuery } = require('../../database')

module.exports = async function (fastify, options) {
    fastify.get(
        '/list',
        {
            schema: {
                description: 'Get a list of all the anime',
                response: {
                    200: {
                        description: 'Anime list',
                        type: 'array',
                        items: {
                            type: 'object',
                            properties: {
                                id: { type: 'number', example: 0 },
                                name: { type: 'string', example: 'Naruto' },
                                date: { type: 'string', example: '2023-01-01' },
                                cover: {
                                    type: 'string',
                                    example:
                                        'https://www.animelove.tv/assets/img/KawaisugiCrisis.jpg'
                                }
                            }
                        }
                    },
                    404: {
                        description: 'No anime is available',
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
            const result = (await db.query('SELECT * FROM Anime'))[0]

            if (!result.length) {
                res.code(404).send({ error: 'No anime is available' })
                return
            }

            res.code(200).send(result)
        }
    )
}
