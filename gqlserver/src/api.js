// adds src to NODE_PATH
require('app-module-path/register');

var logger=require('./api-logger').getLogger('api')

const device = require('express-device')
const useragent = require('express-useragent')
const appmorgan  = require('./api-morgan')
const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const router = require('./api-router')

app
  .use(device.capture()) // requred by appmorgan

  .use(useragent.express()) // requred by appmorgan

  .use(appmorgan)

  .use(bodyParser.urlencoded({ extended: true }))

  .use(bodyParser.json())

  .use(function(req, res, next){
    if (req.is('text/*')) {
      req.text = '';
      req.setEncoding('utf8');
      req.on('data', function(chunk){ req.text += chunk });
      req.on('end', next);
    } else {
      next();
    }
  })

  .use((req,res,next) => {
    res.on('finish', () => {
      if (res.statusCode >= 400) {
        logger.error('ERR REQUEST - ' + JSON.stringify({
          req: {
            headers:req.headers,
            query:req.query,
            params:req.params,
            body:req.body
          }
        }));
      }
    });

    next();
  })

  .use((err,req,res,next) =>{
     if(err.name === 'ValidationError')
     {
         var valErrors = [];
         Object.keys(err.errors).forEach(key => valErrors.push(err.errors[key].message));
         res.status(422).send(valErrors);
     }
      next();
   })

  .disable('etag') // to suppress 304

  .use('/api', router)

;(async () => {
  // await require('cache').init();

  const server = await require('./setup-graphql').start(app,'/graphql');

  const port = process.env.PORT || 3000;
  await new Promise( resolve => app.listen({ port }, resolve ));

  const endpointPort = process.env.ENDPOINT_PORT || 25080

  logger.info(`Running API server at http://localhost:${endpointPort}/api`)
  logger.info(`Running a GraphQL API server at http://localhost:${endpointPort}${server.graphqlPath}`)
})()
