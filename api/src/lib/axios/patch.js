module.exports = (url,data,options = {}) => {
  const axios = options.axios || require('axios')
  const params = options.params || {}
//   const data = options.data || {}

  return axios({
      url,
      method: 'put',
      data,
      headers: {
        'Content-Type': 'application/json',
        ...options.headers,
      },
      ...options.other,
    })
    .then(response => {
      return response.data;
    })
    .catch(options.errorHandler);
}
