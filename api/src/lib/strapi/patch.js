const axios = require('lib/axios')
const axiosErrorHandler = require('lib/axios/errorHandler')
const strapiErorrHandler = require('./error')

const { STRAPI_URL } = require('../../constants')

module.exports = async (collection,id,data,options={}) => {
  try {
    return await axios.patch(`${STRAPI_URL}/${collection}/${id}`,
      data, {
      headers: {
        'content-Type': 'application/json',
        accept: 'application/json',
        ...options?.headers,
      },
      errorHandler: axiosErrorHandler
    })
  }
  catch (err) {
    strapiErorrHandler(err)
  }
}
