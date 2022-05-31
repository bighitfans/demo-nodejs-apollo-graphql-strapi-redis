const axios = require('lib/axios')
const axiosErrorHandler = require('lib/axios/errorHandler')
const strapiErorrHandler = require('./error')

const { STRAPI_URL } = require('../../constants')

//module.exports = async (params={_sort:'updated_at:DESC'}) => {
module.exports = async (collection,id,params,options={}) => {
  try {
    return await axios.del(`${STRAPI_URL}/${collection}/${id}`,{
      params,
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
