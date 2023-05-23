const { getInstance, prepareQuery } = require('../../database')

module.exports = async function (fastify, options) {
    fastify.get('/:username/list', async (req, res) => {
        const db = await getInstance()
        const username = req.params['username']
        const user = await getUser(username)

        if (!user) {
            res.code(401).send({ error: "User doesn't exist" })
            return
        }

        const query = prepareQuery(
            `SELECT DISTINCT a.*, COUNT(e.id) AS episodes
            FROM List l JOIN Anime a ON (l.anime = a.id)
            JOIN Episode e ON (e.anime = a.id)
            WHERE l.user = ?
            GROUP BY a.id`,
            [user.id]
        )

        const result = (await db.query(query))[0]

        if (!result.length) {
            res.code(204)
            return
        }

        res.code(200).send(result)
    })
}

async function getUser(username) {
    const db = await getInstance()
    const query = prepareQuery('SELECT * FROM User WHERE username = ?', [
        username
    ])
    const result = (await db.query(query))[0][0]
    return result
}
