const axios = require('lib/axios')
const axiosErrorHandler = require('lib/axios/errorHandler')
const strapiErorrHandler = require('./error')

const { STRAPI_URL } = require('../../constants')

//module.exports = async (params={_sort:'updated_at:DESC'}) => {
module.exports = async (collection,params,options={subpath:''}) => {
  try {
    return await axios.get(`${STRAPI_URL}/${collection}${options?.subpath}`,{
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
