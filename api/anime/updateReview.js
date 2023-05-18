const { getInstance, prepareQuery } = require('../../database')

module.exports = async function (fastify, options) {
    fastify.patch('/:id/review', async (req, res) => {
        const db = await getInstance()
        const token = req.headers['x-auth-token']
        const { text, score } = req.body
        const anime = req.params['id']

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

        const user = await getUser(token)

        if (!user) {
            res.code(401).send({ error: 'Invalid token' })
            return
        }

        const checkReviewExists = prepareQuery(
            'SELECT id FROM Review WHERE user = ? AND anime = ?',
            [user.id, anime]
        )
        const reviewId = (await db.execute(checkReviewExists))[0][0]

        if (!reviewId) {
            res.code(404).send({ error: 'You have not reviewed this anime' })
            return
        }

        const query = prepareQuery(
            `UPDATE Review SET text = ? score = ? WHERE id = ?`,
            [text, score, reviewId]
        )
        const result = (await db.query(query))[0]

        if (result.affectedRows != 1) {
            res.code(500).send({
                error: 'An error has occurred while updating the review'
            })
        }

        res.code(200)
    })
}

async function getUser(token) {
    const db = await getInstance()
    const query = prepareQuery('SELECT id FROM User WHERE token = ?', [token])
    const result = (await db.query(query))[0][0]
    return result
}
