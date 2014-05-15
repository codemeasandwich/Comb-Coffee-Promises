comb = require("comb")

new comb.Promise().callback().chain(->
	new comb.Promise().errback(new Error("error"))
).chain(->
	prev + " world!"
).classic (err, str) ->
	console.log(err.message) # "error"
