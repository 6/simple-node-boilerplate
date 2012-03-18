express = require 'express'

exports.constants = constants =
  view_engine: "ejs"
  port: process.env.PORT or 3000
  public: "#{__dirname}/public"

exports.expressApp = (app) ->
  app.configure ->
    app.set "views", "#{__dirname}/views"
    app.set "view engine", constants.view_engine

    app.use require("stylus").middleware
      src: "#{__dirname}/styles"
      dest: constants.public
      compress: true
    app.use express.compiler
      src: "#{__dirname}/coffee"
      dest: constants.public
      enable: ['coffeescript']
    app.use express.static constants.public
    app.use express.bodyParser()
    app.use app.router
