# Module dependencies
application_root = __dirname
express = require('express')
path = require('path')
mongoose = require('mongoose')

# Create server
app = express()

# Configure server
app.configure(()->
	# parse request body and populates
	app.use(express.bodyParser())

	# Check request.body for HTTP method overrides
	app.use(express.methodOverride())

	# Perform route lookup based on URL and HTTP method
	app.use(app.router)

	# Where to serve static content
	app.use(express.static(path.join(application_root,'site')))

	# Show all errors in development
	app.use(express.errorHandler({dumpExceptions:true,showStack:true}))
	)

# Routes
app.get('/api', (request,response)->
	response.send('Our API is working!')
	)

# Connect to database
mongoose.connect('mongodb://localhost/AirDB')

# Start server
port = 1920
app.listen(port, ()->
	console.log 'Express server listening on port %d in $s mode', port, app.settings.env
	)