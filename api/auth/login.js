const Database = require('../../database')

module.exports = async function (fastify, options) {
  fastify.post('/login', async (req, res) => {
    let {username, password} = req.body
    let result = await Database.login(username, password)
    console.log(result)
  })
}

