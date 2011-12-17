express = require 'express'
config = require("./config").config
app = express.createServer()
public = "#{__dirname}/public"

app.configure(() ->
  app.set "views", "#{__dirname}/views"
  app.set "view engine", config.view_engine

  app.use require("stylus").middleware(
    src: "#{__dirname}/styl"
    dest: public
    compress: true
  )
  app.use express.compiler(
    src: "#{__dirname}/coffee"
    dest: public
    enable: ['coffeescript']
  )
  app.use express.static(public)
  app.use express.bodyParser()
  app.use app.router
)

app.get '/', (req, res) -> res.render 'index', {title: 'hello'}

app.listen(config.port)
console.log "server started on localhost:#{config.port}"
