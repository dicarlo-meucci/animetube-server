const { getInstance, prepareQuery } = require('../../database')

module.exports = async function (fastify, options) {
    fastify.patch('/picture', async (req, res) => {
        const db = await getInstance()
        const token = req.headers['x-auth-token']
        const { picture } = req.body
        const query = prepareQuery(`UPDATE User SET pfp = ? WHERE token = ?`, [
            picture,
            token
        ])
        const result = (await db.query(query))[0]

        if (!result.affectedRows) {
            res.code(401).send({ error: 'Invalid token' })
            return
        }

        res.code(200)
    })
}
