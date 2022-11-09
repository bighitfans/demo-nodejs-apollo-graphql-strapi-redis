
module.exports = (url,options = {}) => {

  const axios = options.axios || require('axios')
  //const errorHandler = options.errorHandler || return('./errorHandler')
  const params = options.params || {}

  return axios({
    url,
    method: 'delete',
    params,
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
};
