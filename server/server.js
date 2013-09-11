// Generated by CoffeeScript 1.6.3
var app, application_root, calibrationReport, express, mongoose, path, port;

application_root = __dirname;

express = require('express');

path = require('path');

mongoose = require('mongoose');

app = express();

app.configure(function() {
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(app.router);
  app.use(express["static"](path.join(application_root, 'site')));
  return app.use(express.errorHandler({
    dumpExceptions: true,
    showStack: true
  }));
});

app.get('/api', function(request, response) {
  return response.send('Our API is working!');
});

mongoose.connect('mongodb://localhost/AirDB');

calibrationReport = new mongoose.Schema({});

port = 1920;

app.listen(port, function() {
  return console.log('Express server listening on port %d in $s mode', port, app.settings.env);
});
