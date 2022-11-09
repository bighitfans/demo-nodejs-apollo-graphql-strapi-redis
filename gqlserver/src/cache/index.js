
const {
  client,
} = require('./client')

module.exports = {
  init: async() => {
    await client.connect();
  },

  client,
}
