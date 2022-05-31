const router = require("express").Router();

const logger = require("./api-logger").getLogger("api-router");

//jk // add deviceInfo endpoint
//jk require("./controllers/deviceInfo")(router);
//jk // file uploadToStrapi
//jk require("./controllers/uploadToCms")(router);
//jk
//jk // add user endpoint
//jk require("./controllers/user")(router);
//jk
//jk require("./controllers/job")(router);

module.exports = router.get("/healthCheck", (req, res) => {
  return res.status(200).send("<h1>api</h1>");
});
