 fs = require("fs")
comb = require("comb")

readFile = (file, encoding) ->
	ret = new comb.Promise()
	fs.readFile(file, encoding or "utf8", (err) ->
		if (err)
			ret.errback(err)
		else
			ret.callback(comb.argsToArray(arguments, 1)))

	ret.promise()

errorHandler = ->
	console.log("Error handler")

readFile("myFile.txt").then ((text) ->
	console.log(text)
), errorHandler
