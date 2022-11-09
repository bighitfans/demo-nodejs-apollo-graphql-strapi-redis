
const morgan  = require('morgan');

morgan.token('timestamp', function (req, res) { return Date.now() })

// tokens from express-useragent
morgan.token('devicetype', function (req, res) { return req.device.type })

morgan.token('os', function (req, res) { return req.useragent.os })

morgan.token('browser', function (req, res) { return req.useragent.browser })

morgan.token('browserVersion', function (req, res) { return req.useragent.version })

morgan.token('action', function (req, res) {

	action = req.path.split('/')[1];

	return action ? action : 'api';
});

morgan.token('statusname', function (req, res) {
	switch(res.statusCode) {
		case 200:
			return 'SUCCESS';
		case 201:
			return 'CREATED';
		default:
			return 'FAILED';
	}
})

//This tells express to log via morgan
//and morgan to log in the "combined" pre-defined format
const appmorgan = morgan(
  process.env.ACCESS_LOG_FORMAT || ':timestamp [portal-api] [ACCESS] - [:method :url HTTP/:http-version] [:remote-addr] [:devicetype] [:os] [:browser] [:browserVersion] [:action] [:statusname] - :status :response-time ms :res[content-length]'
);

module.exports = appmorgan;
