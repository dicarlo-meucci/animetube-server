const { getInstance, prepareQuery } = require('../../database')

module.exports = async function (fastify, options) {
    fastify.get(
        '/:id',
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
                            id: { type: 'number', example: 0 },
                            name: { type: 'string', example: 'Naruto' },
                            studio: {
                                type: 'string',
                                example: 'Nippon Animation'
                            },
                            description: {
                                type: 'string',
                                example:
                                    'Juntang, uno studente universitario pronto a ricominciare la sua vita in un nuovo appartamento...'
                            },
                            date: { type: 'string', example: '2023-01-01' },
                            cover: {
                                type: 'string',
                                example:
                                    'https://www.animelove.tv/assets/img/KawaisugiCrisis.jpg'
                            },
                            episodes: {
                                type: 'array',
                                items: {
                                    type: 'object',
                                    properties: {
                                        link: {
                                            type: 'string',
                                            example:
                                                'https://www.animelove.tv/anime/2362-Kawaisugi-Crisis/1/'
                                        }
                                    }
                                }
                            },
                            tags: {
                                type: 'array',
                                items: {
                                    type: 'string',
                                    example: ['Drama', 'Fantasy']
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
            const id = req.params['id']
            const query = prepareQuery(`SELECT * FROM Anime WHERE id = ?`, [id])
            const anime = (await db.query(query))[0][0]

            if (!anime) {
                res.code(404).send("Anime doesn't exist")
                return
            }

            const episodesQuery = prepareQuery(
                `SELECT link FROM Episode WHERE anime = ?`,
                [id]
            )

            const episodes = (await db.query(episodesQuery))[0]
            anime.episodes = episodes

            const tagsQuery = prepareQuery(
                `SELECT name FROM Tag WHERE anime = ?`,
                [id]
            )
            const tags = (await db.query(tagsQuery))[0]

            anime.tags = []

            for (const tag of tags) {
                anime.tags.push(tag.name.trim())
            }

            const result = anime
            res.code(200).send(result)
        }
    )
}
