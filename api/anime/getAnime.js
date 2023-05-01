const Database = require('../../database/index.js')

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
                    403: {
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
            const id = req.params['*']
            try {
                res.code(200).send(await Database.getAnime(id))
            } catch (error) {
                console.log(error)
                res.code(403).send({ error })
            }
        }
    )
}
