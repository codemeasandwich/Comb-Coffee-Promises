fs = require("fs")
comb = require("comb")

readFile = (file, encoding) ->
	ret = new comb.Promise()
	fs.readFile(file, encoding or "utf8", ret.resolve.bind(ret))
	ret.promise()

errorHandler = ->
	console.log("Error handler")

readFiles = ->
	files = comb.argsToArray(arguments).map((file) ->
		readFile(file)
	)
	new comb.PromiseList(files, true).promise()

errorHandler = ->
	console.log("Error handler")

readFiles("myFile.txt", "myFile2.txt", "myFile3.txt").then ((files) ->
	files.forEach (data) ->
		console.log(data)
), errorHandler
