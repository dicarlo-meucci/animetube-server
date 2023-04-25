const Database = require('../../database')

module.exports = async function (fastify, options) {
    fastify.post('/login', async (req, res) => {
        let { username, password } = req.body
        try {
            let result = await Database.login(username, password)
            res.send(result)
        } catch (error) {
            res.code(403).send({ error })
        }
    })
}
