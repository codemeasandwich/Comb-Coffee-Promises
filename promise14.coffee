fs = require("fs")
comb = require("comb")

readFile = (file, encoding) ->
	ret = new comb.Promise()
	fs.readFile(file, encoding or "utf8", ret.resolve.bind(ret))
	ret.promise()

readFileSync = ->
	fs.readFileSync.apply(fs, arguments)

errorHandler = ->
	console.log("Error handler")

comb.when( readFile("myFile.txt"),
	readFileSync("myFile.txt"),
	readFile("myFile1.txt"),
	readFileSync("myFile1.txt"),
	readFile("myFile2.txt"),
	readFileSync("myFile2.txt")
).then ((files) ->
	files.forEach (data) ->
		console.log(data)
), errorHandler
