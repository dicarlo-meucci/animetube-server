module.exports = async function (fastify, options) {
    fastify.post('/register', async (req, res) => {
        res.send('register')
    })
}
