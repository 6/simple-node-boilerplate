express = require 'express'
app = express.createServer()
public = "#{__dirname}/public"
assets = "#{__dirname}/assets"

app.configure(() ->
  app.set "views", "#{assets}/views"
  app.set "view engine", "jade"

  app.use require("stylus").middleware(
    src: "#{assets}/styl"
    dest: public
    compress: true
  )
  app.use express.compiler(
    src: "#{assets}/coffee"
    dest: public
    enable: ['coffeescript']
  )
  app.use express.static(public)
  app.use express.bodyParser()
  app.use app.router
)

app.get '/', (req, res) -> res.render 'index', {title: 'hello'}

port = 3000
app.listen(port)
console.log "server started on localhost:#{port}"
