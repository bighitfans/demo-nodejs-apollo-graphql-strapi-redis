
var log4js = require('log4js');

log4js.configure({
  pm2: true,
  appenders: {
    portal_api: {
      type: 'console',
    },

    appfile: { type: "file", filename: "cheese.log" } },
  categories: { default: { appenders: ["portal_api"], level: process.env.APPLOGLEVEL || "debug" } }
});

var logger = log4js.getLogger('[myapp-api]');

module.exports = logger;

module.exports.getLogger = (name) => {

  return {
    log: (...args)    => logger.info   (`[${name}]`,...args) ,
    info: (...args)    => logger.info   (`[${name}]`,...args) ,
    warning: (...args) => logger.warning(`[${name}]`,...args) ,
    debug: (...args)   => logger.debug  (`[${name}]`,...args) ,
    error: (...args)   => logger.error  (`[${name}]`,...args) ,
    trace: (...args)   => logger.trace  (`[${name}]`,...args) ,
  }
} // module.exports
