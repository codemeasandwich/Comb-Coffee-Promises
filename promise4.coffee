fs = require("fs")
comb = require("comb")

readFile = (file, encoding) ->
	ret = new comb.Promise()
	fs.readFile(file, encoding or "utf8", ret.resolve.bind(ret))
	ret.promise()

readAndConvertToUppercase = (file, encoding) ->
	ret = new comb.Promise()
	readFile("myFile.txt").then ((data) ->
		ret.callback(data.toUpperCase())
	), ret
	ret.promise()

readAndConvertToUppercase("myFile.txt").then ((file) ->
	console.log("file")
), (err) ->
	console.log(err)
