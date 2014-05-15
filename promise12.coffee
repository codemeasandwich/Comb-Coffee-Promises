comb = require("comb")

new comb.Promise().callback().chain(->
	throw new Error("error")
, ->
	throw new Error("error not handled")
).classic (err, str) ->
	console.log(err.message) # "error not handled"
