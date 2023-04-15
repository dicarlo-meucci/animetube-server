module.exports = async function(fastify, options) {
    fastify.get('/user', async (req, res) => {
      res.send('user query')
    })
  }
