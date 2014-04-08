
process.env.NODE_ENV = 'test'

require('coffee-script/register');

var path = require('path')
  , app = require(path.resolve('config', 'app'));

// number of middleware

var n = parseInt(process.env.MW || '1', 10);
console.log('  %s middleware', n);

while (n--) {
  app.use(function(req, res, next){
    next();
  });
}

var body = new Buffer('Hello World');

app.use(function(req, res, next){
  res.send(body);
});

app.set('port', 3333);

app.listen(app.get('port'));

