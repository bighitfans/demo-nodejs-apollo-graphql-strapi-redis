const axios = require("lib/axios");
const axiosErrorHandler = require("lib/axios/errorHandler");
const strapiErorrHandler = require("./error");

const { STRAPI_URL } = require("../../constants");
var FormData = require("form-data");

module.exports = ({ file, jobId }) => {
  var form = new FormData();

  //console.log(`${STRAPI_URL}/upload`)

  if (file?.buffer) {
    //console.log("File Buffer exist, uploading to cms")

    form.append("files", file.buffer, {
      filename: jobId + "_" + file.originalname,
    });
  } else {
    //console.log("File Buffer doesn't exist, uploading to cms")

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
      //console.log(`strapi/upload -> res -> ${JSON.stringify(res)}`)
      /*
         [{"id":6,"name":"others_1638980039018.628.jpg","alternativeText":null,"caption":null,"width":1668,"height":1668,"formats":{"thumbnail":{"name":"thumbnail_others_1638980039018.628.jpg","hash":"thumbnail_others_1638980039018_628_05a0030a90","ext":".jpg","mime":"image/jpeg","width":156,"height":156,"size":6.32,"path":null,"url":"https://bighit-dev.s3.ap-south-1.amazonaws.com/thumbnail_others_1638980039018_628_05a0030a90.jpg"},"large":{"name":"large_others_1638980039018.628.jpg","hash":"large_others_1638980039018_628_05a0030a90","ext":".jpg","mime":"image/jpeg","width":1000,"height":1000,"size":169.58,"path":null,"url":"https://bighit-dev.s3.ap-south-1.amazonaws.com/large_others_1638980039018_628_05a0030a90.jpg"},"medium":{"name":"medium_others_1638980039018.628.jpg","hash":"medium_others_1638980039018_628_05a0030a90","ext":".jpg","mime":"image/jpeg","width":750,"height":750,"size":97.27,"path":null,"url":"https://bighit-dev.s3.ap-south-1.amazonaws.com/medium_others_1638980039018_628_05a0030a90.jpg"},"small":{"name":"small_others_1638980039018.628.jpg","hash":"small_others_1638980039018_628_05a0030a90","ext":".jpg","mime":"image/jpeg","width":500,"height":500,"size":47.85,"path":null,"url":"https://bighit-dev.s3.ap-south-1.amazonaws.com/small_others_1638980039018_628_05a0030a90.jpg"}},"hash":"others_1638980039018_628_05a0030a90","ext":".jpg","mime":"image/jpeg","size":413.9,"url":"https://bighit-dev.s3.ap-south-1.amazonaws.com/others_1638980039018_628_05a0030a90.jpg","previewUrl":null,"provider":"aws-s3","provider_metadata":null,"created_at":"2021-12-08T16:14:00.000Z","updated_at":"2021-12-08T16:14:00.000Z","related":[]}]
         */
      //console.log("Uploaded Response -->", res)
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
