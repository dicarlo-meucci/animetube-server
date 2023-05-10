const { getInstance, prepareQuery } = require('../../database')

module.exports = async function (fastify, options) {
    fastify.patch('/banner', async (req, res) => {
        const db = await getInstance()
        const token = req.headers['x-auth-token']
        const { banner } = req.body
        const query = prepareQuery(
            `UPDATE User SET banner = ? WHERE token = ?`,
            [banner, token]
        )
        const result = (await db.query(query))[0]

        if (!result.affectedRows) {
            res.code(401).send({ error: 'Invalid token' })
            return
        }

        res.code(200)
    })
}
