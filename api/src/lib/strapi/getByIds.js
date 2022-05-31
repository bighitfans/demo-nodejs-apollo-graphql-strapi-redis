const axios = require('lib/axios')
const axiosErrorHandler = require('lib/axios/errorHandler')
const strapiErorrHandler = require('./error')

const { STRAPI_URL } = require('../../constants')

//module.exports = async (params={_sort:'updated_at:DESC'}) => {
module.exports = async (collection,ids,params,options={}) => {
  try {
    let query='';
    if(ids.length > 0) {
      query=`id_in=${ids[0]}`

      for(i=1;i<ids.length;)
        query+=`&id_in=${ids[i++]}`
    }

    return await axios.get(`${STRAPI_URL}/${collection}?${query}`,{
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
