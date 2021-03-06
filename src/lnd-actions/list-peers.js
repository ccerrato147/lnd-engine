const { deadline } = require('../grpc-utils')

/**
 * Returns a list of peers connected to the specified lnd instance
 *
 * @return {Promise<Array>}
 */
function listPeers ({ client }) {
  return new Promise((resolve, reject) => {
    client.listPeers({}, { deadline: deadline() }, (err, res) => {
      if (err) return reject(err)
      return resolve(res)
    })
  })
}

module.exports = listPeers
