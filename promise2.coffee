fs = require("fs")
comb = require("comb")

readFile = (file, encoding) ->
	ret = new comb.Promise()
	fs.readFile(file, encoding or "utf8", ret.resolve.bind(ret))
	ret.promise()

errorHandler = ->
	console.log("Error handler")

readFile("myFile.txt").then ((text) ->
	console.log(text)
), errorHandler
