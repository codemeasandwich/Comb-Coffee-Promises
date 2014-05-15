fs = require("fs")
comb = require("comb")

readFile = (file, encoding) ->
	ret = new comb.Promise()
	fs.readFile(file, encoding or "utf8", ret.resolve.bind(ret))
	ret.promise()

readFilePromise = readFile("myFile.txt")

readFilePromise.then ((file) ->
	console.log("file")
), (err) ->
	console.log(err)

readFilePromise.then (file) ->
	console.log(file)
