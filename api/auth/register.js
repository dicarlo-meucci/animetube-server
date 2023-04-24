const Database = require('../../database')

module.exports = async function (fastify, options) {
    fastify.post('/register', async (req, res) => {
        let { email, username, password } = req.body
        let result = await Database.register(email, username, password)
        res.send(result)
    })
}
