const axios = require('lib/axios')
const axiosErrorHandler = require('lib/axios/errorHandler')
const strapiErorrHandler = require('./error')

const { STRAPI_URL } = require('../../constants')

module.exports = async (collection,params) => {
  try {
    return await axios.get(`${STRAPI_URL}/${collection}/count`,  {
      params,
      headers: {
        'content-Type': 'application/json',
        accept: 'application/json'
      },
      errorHandler: axiosErrorHandler
    })
  }
  catch (err) {
    strapiErorrHandler(err)
  }
}
