const { getInstance, prepareQuery } = require('../../database')

module.exports = async function (fastify, options) {
    fastify.get('/:username/reviews', async (req, res) => {
        const db = await getInstance()
        const username = req.params['username']
        const user = await getUser(username)

        if (!user) {
            res.code(401).send({ error: "User doesn't exist" })
            return
        }

        const query = prepareQuery(
            `SELECT r.text, (r.score / 20) as score,
            a.name as animeName, u.username as user,
            a.cover as animeCover, a.id as animeId, COUNT(e.id) as animeEpisodes
            FROM Review r
            INNER JOIN Anime a ON (r.anime = a.id) 
            INNER JOIN User u ON (r.user = u.id)
            INNER JOIN Episode e ON (a.id = e.anime)
            WHERE r.user = ?`,
            [user.id]
        )

        const result = (await db.query(query))[0]

        if (result[0].text == null && result[0].score == null) {
            res.code(204)
            return
        }

        for (const review of result) {
            review.anime = {
                id: review.animeId,
                name: review.animeName,
                cover: review.animeCover,
                episodes: review.animeEpisodes,
            }

            delete review.animeCover
            delete review.animeId
            delete review.animeName
            delete review.animeEpisodes
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
