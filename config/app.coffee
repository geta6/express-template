path = require 'path'
http = require 'http'
redis = require 'redis'
express = require 'express'
session = require 'express-session'
passport = require 'passport'

pkg = require path.resolve 'package.json'
app = module.exports = express()

app.set 'views', path.resolve 'views'
app.set 'view engine', 'jade'

app.use (require 'static-favicon')()
app.use (require 'morgan')('dev') if 'test' isnt process.env.NODE_ENV
app.use (require 'body-parser').json()
app.use (require 'body-parser').urlencoded()
app.use (require 'cookie-parser')()
app.use session
  secret: 'keyboard cat'
  cookie: expires: no
  store: new ((require 'connect-redis') session)
    prefix: "#{pkg.name}:"
app.use passport.initialize()
app.use passport.session()
app.use express.static path.resolve 'public'

app.get '/', (req, res) ->
  res.render 'index', title: 'Express'

app.use (req, res, next) ->
  err = new Error 'Not Found'
  err.status = 404
  return next err

if (app.get 'env') is 'development'
  app.use (err, req, res, next) ->
    res.render 'error', error: err, message: err.message
else
  app.use (err, req, res, next) ->
    res.render 'error', error: {}, message: err.message

