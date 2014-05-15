comb = require("comb")

new comb.Promise().callback().chain(->
	throw new Error("error")
, ->
	new comb.Promise().errback(new Error("error not handled"))
).classic (err, str) ->
	console.log(err.message) # "error not handled"
