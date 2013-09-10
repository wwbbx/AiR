backboneLib = require './lib/backbone-min'
underscore = require './lib/underscore-min'

unitInfo = backboneLib.Backbone.Model.extend({
	# default value for Device Under Test
	default:{
		modelNumber:'defaultModel',
		serialNumber:'defaultSerial'
	}
	})

unitInfoInstance = new unitInfo()
console.log 'Unit Info' + unitInfoInstance.toJSON()