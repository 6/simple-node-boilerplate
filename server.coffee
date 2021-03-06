express = require 'express'
config = require './config'
app = express.createServer()
config.expressApp app,
  view_engine: "jade"

app.get '/', (req, res) -> res.render 'index', {title: 'hello'}

app.listen(config.constants.port)
console.log "server started on localhost:#{config.constants.port}"
