const { getInstance, prepareQuery } = require('../../../database')

module.exports = async function (fastify, options) {
    fastify.post('/remove', async (req, res) => {
        const db = await getInstance()
        const token = req.headers['x-auth-token']
        const { anime } = req.body
        const user = await getUser(token)

        if (!token) {
            res.code(401).send({ error: 'Authentication token not provided' })
            return
        }

        if (!user) {
            res.code(401).send({ error: 'Invalid token' })
            return
        }

        const checkIfExists = prepareQuery(
            'SELECT * FROM List WHERE anime = ? AND user = ?',
            [anime, user.id]
        )
        const exists = (await db.query(checkIfExists))[0][0]

        if (!exists) {
            res.code(403).send({ error: 'This list does not exists' })
            return
        }

        const query = prepareQuery('DELETE List WHERE anime = ? AND user = ?',
            [anime,user.id]
        )
        const result = (await db.execute(query))[0]

        if (result.affectedRows != 1) {
            res.code(500).send({ error: 'Could not remove list' })
            return
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
