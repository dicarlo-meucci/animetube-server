const { getInstance, prepareQuery } = require('../../database')

module.exports = async function (fastify, options) {
    fastify.get('/', async (req, res) => {
        const token = req.headers['x-auth-token']
        const result = await getUserInfo(token)

        if (!result) {
            res.code(401).send({error: 'Invalid token'})
        }

        res.code(200).send(result)
    })
}

async function getUserInfo(token) {
    const db = await getInstance()
    const query = prepareQuery(
        `SELECT username, email, banner, pfp
        FROM User WHERE token = ?`,
        [token]
    )

    const result = (await db.query(query))[0]

    if (!result.length) return null

    return result[0]
}