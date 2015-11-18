var serveStatic = require('serve-static');

var bozzisms = require('../data/bozzisms.json');

module.exports = function(robot) {
  var app = robot.router;
  app.use('/assets', serveStatic(__dirname + '/../assets'));
  app.set('view engine', 'ejs');
  app.get('/', function(req, res) {
    res.render('index', { bozzisms: bozzisms })
  })
}
