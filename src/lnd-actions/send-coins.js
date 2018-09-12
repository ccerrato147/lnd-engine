const { deadline } = require('../grpc-utils')

/**
 * Check's an invoice status
 *
 * @function
 * @see {@link http://api.lightning.community/#sendCoins}
 * @param {String} addr
 * @param {Integer} amount
 * @return {Object} response
 * @return {String} response.txid
 */
function sendCoins ({addr, amount}, { client }) {
  return new Promise((resolve, reject) => {
    client.sendCoins({ addr, amount }, { deadline: deadline() }, (err, res) => {
      if (err) return reject(err)
      return resolve(res)
    })
  })
}

module.exports = sendCoins
