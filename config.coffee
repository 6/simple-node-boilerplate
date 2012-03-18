express = require 'express'

# Compress generated less files  
# Thanks to Matt Sain - http://stackoverflow.com/a/8379561/713518
express.compiler.compilers.less.compile = (str, fn) ->
  less = require("less") unless less?
  try
    less.render(str, {compress: true}, fn)
  catch err
    fn(err)

exports.constants = constants =
  port: process.env.PORT or 3000
  public: "#{__dirname}/public"

exports.expressApp = (app, config) ->
  app.configure ->
    app.set "views", "#{__dirname}/views"
    app.set "view engine", config.view_engine
    
    if config.style_engine is "stylus"
      app.use require("stylus").middleware
        src: "#{__dirname}/styles"
        dest: constants.public
        compress: true
    else if config.style_engine is "less"
      app.use express.compiler
        src:"#{__dirname}/styles"
        dest: constants.public
        enable:['less']
    app.use express.compiler
      src: "#{__dirname}/coffee"
      dest: constants.public
      enable: ['coffeescript']
    app.use express.static constants.public
    app.use express.bodyParser()
    app.use app.router
