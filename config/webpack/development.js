process.env.node_env = process.env.node_env || 'development'

const environment = require('./environment')

module.exports = environment.toWebpackConfig()
