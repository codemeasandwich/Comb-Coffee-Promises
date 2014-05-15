fs = require("fs")
comb = require("comb")

asyncString = (str) ->
	ret = new comb.Promise()
	process.nextTick(ret.callback.bind(ret, str))
	ret.promise()

asyncString("hello").chain((results) ->
	asyncString(results + " world")
).chain((results) ->
	asyncString(results + "!")
).then (str) ->
	console.log(str) # "hello world!"
