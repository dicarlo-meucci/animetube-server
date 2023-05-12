const { getInstance, prepareQuery } = require('../../database')
// write a description object based on the code you see
// follow this template

module.exports = async function (fastify, options) {
    fastify.post(
        '/review',
        {
            schema: {
                description: 'Post a review',
                params: {
                    type: 'object',
                    properties: {
                        anime: {
                            type: 'string',
                            description: 'the anime to review'
                        },
                        text: {
                            type: 'string',
                            description: 'the review text'
                        },
                        score: {
                            type: 'number',
                            description: 'the review score'
                        }
                    }
                },
                response: {
                    200: {
                        description: 'The review was posted successfully',
                        type: 'null'
                    },
                    400: {
                        description: 'The request is missing information',
                        type: 'object',
                        properties: {
                            error: { type: 'string' }
                        }
                    },
                    401: {
                        description: 'Wrong credentials were provided',
                        type: 'object',
                        properties: {
                            error: { type: 'string' }
                        }
                    },
                    404: {
                        description: "Anime doesn't exist",
                        type: 'object',
                        properties: {
                            error: { type: 'string' }
                        }
                    },
                    409: {
                        description: 'You already reviewed this anime',
                        type: 'object',
                        properties: {
                            error: { type: 'string' }
                        }
                    },
                    500: {
                        description: 'An error has occurred while uploading the review',
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
            const token = req.headers['x-auth-token']
            const { anime, text, score } = req.body

            if (score == null || anime == null) {
                res.code(400).send({
                    error: 'The request is missing information'
                })
                return
            }

            if (score < 1 || score > 100) {
                res.code(400).send({
                    error: 'Score is out of bounds. Allowed values start from 1 to 100'
                })
                return
            }

            const checkAnimeExists = prepareQuery(
                'SELECT id FROM Anime WHERE id = ?',
                [anime]
            )
            const animeExists = (await db.query(checkAnimeExists))[0][0]

            if (!animeExists) {
                res.code(404).send({ error: "Anime doesn't exist" })
                return
            }

            const user = await getUser(token)

            if (!user) {
                res.code(401).send({ error: 'Invalid token' })
                return
            }

            const checkReviewExists = prepareQuery(
                'SELECT id FROM Review WHERE user = ? AND anime = ?',
                [user.id, anime]
            )
            const reviewExists = (await db.execute(checkReviewExists))[0][0]

            if (reviewExists) {
                res.code(409).send({ error: 'You already reviewed this anime' })
                return
            }

            const query = prepareQuery(
                `INSERT INTO Review(id, text, score, date, user, anime)
        VALUES(default, ?, ?, ?, ?, ?)`,
                [text, score, new Date(), user.id, anime]
            )
            const result = (await db.query(query))[0]

            if (result.affectedRows != 1) {
                res.code(500).send({
                    error: 'An error has occurred while uploading the review'
                })
            }

            res.code(200)
        }
    )
}

async function getUser(token) {
    const db = await getInstance()
    const query = prepareQuery('SELECT id FROM User WHERE token = ?', [token])
    const result = (await db.query(query))[0][0]
    return result
}
