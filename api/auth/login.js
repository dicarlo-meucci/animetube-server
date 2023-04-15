module.exports = async function(fastify, options) {
    fastify.post('/login', async (req, res) => {
      res.send('balls')
    })
  }
