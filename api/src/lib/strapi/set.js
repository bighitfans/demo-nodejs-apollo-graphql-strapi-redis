const axios = require('lib/axios')
const axiosErrorHandler = require('lib/axios/errorHandler')
const strapiErorrHandler = require('./error')
const patch = require('./patch')
const { STRAPI_URL } = require('../../constants')

module.exports = async(collection, data, options={}) => {

  if(data.id)
    return await patch(collection, data.id, data, options)
  else
    return await _set(collection, data, options)

}
  const _set = async (collection,data,options={}) => {
  try {
    if(data.id){

    } else {
    //console.log(`${STRAPI_URL}/${collection}`)
    return await axios.post(`${STRAPI_URL}/${collection}`,
      data, {
      headers: {
        'content-Type': 'application/json',
        accept: 'application/json',
        ...options?.headers,
      },
      errorHandler: axiosErrorHandler
    })
  }
  }
  catch (err) {
    throw strapiErorrHandler(err)
  }
}
