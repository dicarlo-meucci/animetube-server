const { getInstance, prepareQuery } = require('../../../database')

module.exports = async function (fastify, options)
{
    fastify.get('/', async (req, res) =>
    {
        const db = await getInstance()
        const token = req.headers['x-auth-token']

        if (!token)
        {
            res.code(401).send({ error: 'Authentication token not provided' })
            return
        }

        const user = await getUser(token)

        if (!user)
        {
            res.code(401).send({ error: 'Invalid token' })
            return
        }

        const query = prepareQuery(
            `SELECT a.name as animeName, a.id as animeId, r.text, r.score, r.date 
            FROM Review r
            INNER JOIN User u ON r.user = u.id
            INNER JOIN Anime a ON r.anime = a.id
            WHERE u.id = ?
            ORDER BY r.date DESC`,
            [user.id]
        )

        const result = (await db.execute(query))[0]
        
        if (!result.length) {
            res.code(204)
            return
        }

        for (const review of result)
        {
            review.anime = {
                id: review.animeId,
                name: review.animeName,
            }

            delete review.animeId
            delete review.animeName
        }

        res.code(200).send(result)
    })
}

async function getUser(token)
{
    const db = await getInstance()
    const query = prepareQuery('SELECT id FROM User WHERE token = ?', [token])
    const result = (await db.query(query))[0][0]
    return result
}
