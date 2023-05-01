const Database = require('../../database/index.js')

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
            res.send(await Database.getAnimeList()).code(200)
        }
    )
}
