var express = require('express');

module.exports = function(robot) {
  var app = robot.router;
  app.use('/assets', express.static(__dirname + '/../assets'));
  app.set('view engine', 'ejs');
  app.get('/', function(req, res) {
    res.render('index')
  })
}
