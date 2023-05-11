const fastify = require('fastify')()
const autoload = require('@fastify/autoload')
const path = require('path')
const dotenv = require('dotenv')
const { getInstance } = require('./database')
dotenv.config()

fastify.register(require('@fastify/swagger'), {
    swagger: {
        info: {
            title: 'AnimeTube API',
            description: 'AnimeTube API Documentation',
            version: '0.1.0'
        },
        host: `localhost:${process.env.SERVER_PORT ?? 3000}`,
        schemes: ['http'],
        consumes: ['application/json'],
        produces: ['application/json']
    }
})

fastify.register(require('@fastify/swagger-ui'), {
    routePrefix: '/docs',
    uiConfig: {
        docExpansion: 'full',
        deepLinking: false
    },
    uiHooks: {
        onRequest: function (request, reply, next) {
            next()
        },
        preHandler: function (request, reply, next) {
            next()
        }
    },
    staticCSP: true,
    transformStaticCSP: (header) => header,
    transformSpecification: (swaggerObject, request, reply) => {
        return swaggerObject
    },
    transformSpecificationClone: true
})

fastify.register(require('@fastify/rate-limit'), {
    max: 200,
    timeWindow: '1 minute'
})

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
    if (!request.url.startsWith('/api')) {
        done()
        return
    }

    const now = new Date()

    console.log(
        `[${now.toLocaleDateString('it')} - ${now.toLocaleTimeString('it')}] ${
            request.method
        } ${request.url}`
    )
    done()
})

fastify.listen(
    { host: '0.0.0.0', port: process.env.SERVER_PORT ?? 3000 },
    async (err, address) => {
        if (err) {
            console.error(err)
            process.exit(1)
        }
        console.log('[READY] WebServer on ' + address)
        try {
            await getInstance()
            console.log('[READY] Database on port ' + process.env.DB_PORT)
        } catch (error) {
            console.error('Database is unreachable')
            process.exit(1)
        }
    }
)
