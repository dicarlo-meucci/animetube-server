const { getInstance, prepareQuery } = require('../../database')

module.exports = async function (fastify, options) {
    fastify.get('/:username', async (req, res) => {
        const db = await getInstance()
        const username = req.params['username']
        const query = prepareQuery(
            `SELECT username, banner, pfp FROM User WHERE username = ?`,
            [username]
        )
        const result = (await db.query(query))[0][0]
        if (!result) {
            res.code(404).send({ error: "User doesn't exist" })
            return
        }

        res.code(200).send(result)
    })
}
