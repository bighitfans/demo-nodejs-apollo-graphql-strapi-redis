const axios = require("lib/axios");
const axiosErrorHandler = require("lib/axios/errorHandler");
const strapiErorrHandler = require("./error");

const { STRAPI_URL } = require("../../constants");
var FormData = require("form-data");

module.exports = ({ file, jobId }) => {
  var form = new FormData();

  if (file?.buffer) {
    form.append("files", file.buffer, {
      filename: jobId + "_" + file.originalname,
    });
  } else {
    throw {
      message: "lib/strapi/upload ERROR: no buffer in file",
    };
  }

  return axios
    .post(
      `${STRAPI_URL}/upload`,
      form.getBuffer(), //data
      {
        // options
        errorHandler: axiosErrorHandler,
        headers: form.getHeaders(),
        other: {
          // https://github.com/axios/axios/issues/1362
          maxContentLength: "Infinity",
          maxBodyLength: "Infinity",
        },
      }
    )
    .then((res) => {
      var r = res[0];
      return [
        {
          id: r.id,
          uri: r.url,
        },
      ];
    })
    .catch((err) => {
      strapiErorrHandler(err);
    });
};
