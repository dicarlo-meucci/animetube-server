const fastify = require('fastify')()
const autoload = require('@fastify/autoload')
const path = require('path')

fastify.register(autoload, {
    dir: `${__dirname}/api`,
    dirNameRoutePrefix: true,
    options: { prefix: '/api' }
})

fastify.register(require('@fastify/static'), {
    root: path.join(__dirname, 'public')
})

fastify.register(require('@fastify/cors'), {
    origin: '*'
})

fastify.addHook('onRequest', (request, reply, done) => {
    if(!request.url.startsWith('/api'))
    {
        done()
        return
    }

    let now = new Date()
    console.log(`[${now.toLocaleDateString('it')} - ${now.toLocaleTimeString('it')}] ${request.method} ${request.url}`)
    done()
  })

fastify.listen({ host: '0.0.0.0', port: 3000 }, function (err, address) {
    if (err) {
        fastify.log.error(err)
        process.exit(1)
    }
    console.log('🚀 WebServer ready on ' + address)
})
