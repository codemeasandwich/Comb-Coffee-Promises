fs = require("fs")
comb = require("comb")

readFile = (file, encoding) ->
	ret = new comb.Promise()
	fs.readFile(file, encoding or "utf8", ret.resolve.bind(ret))
	ret.promise()

readFile("myFile.txt").classic( (err, file) ->
	if (err)
		console.log(err)
	else
		console.log(file)
)
