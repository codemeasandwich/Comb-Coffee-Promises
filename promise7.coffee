comb = require("comb")

new comb.Promise().callback().chain("hello").chain((prev) ->
	prev + " world!"
).then (str) ->
	console.log(str) # "hello world!"
