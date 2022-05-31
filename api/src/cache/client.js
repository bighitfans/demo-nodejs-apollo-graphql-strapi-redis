
const Redis = require("ioredis");

let client = new Redis({
  host: process.env.REDIS_HOST || "redis",
  port: process.env.REDIS_PORT || 6379,
});


module.exports = {
  client,
}
