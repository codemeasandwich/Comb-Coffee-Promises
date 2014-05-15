comb = require("comb")

new comb.Promise().callback().chain(->
	throw new Error("error")
, ->
	new comb.Promise().callback("caught error and handled")
).classic (err, str) ->
	console.log(str) # "caught error and handled"
