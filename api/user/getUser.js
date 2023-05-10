const { getInstance, prepareQuery } = require('../../database')

module.exports = async function (fastify, options) {
    fastify.get('/*', async (req, res) => {
        const db = await getInstance()
        const userId = req.params['*']
        const query = prepareQuery(
            `SELECT username, banner, pfp FROM User WHERE id = ?`,
            [userId]
        )
        const result = (await db.query(query))[0]
        if (!result.length) {
            res.code(404).send({ error: "User doesn't exist" })
            return
        }

        res.code(200).send(result)
    })
}
