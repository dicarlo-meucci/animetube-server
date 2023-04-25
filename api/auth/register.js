const Database = require('../../database')

module.exports = async function (fastify, options) {
    fastify.post('/register', async (req, res) => {
        let { email, username, password } = req.body
        try {
            let result = await Database.register(email, username, password)
            res.code(200).send(result)
        } catch (error) {
            res.code(403).send({ error })
        }
    })
}
