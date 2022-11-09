const router = require("express").Router();

const logger = require("./api-logger").getLogger("api-router");

module.exports = router.get("/healthCheck", (req, res) => {
  return res.status(200).send("<h1>api</h1>");
});
