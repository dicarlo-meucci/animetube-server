const Database = require('../../database')

module.exports = async function (fastify, options) {
    fastify.post('/logout', async (req, res) => {
        let { token } = req.body
        try {
            let result = await Database.logout(token)
            res.send(result)
        } catch (error) {
            res.code(403).send({ error })
        }
    })
}
