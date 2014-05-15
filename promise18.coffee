comb = require("comb")

asyncArr = ->
	ret = new comb.Promise()
	process.nextTick(ret.callback.bind(ret, [1, 2, 3, 4, 5]))
	ret.promise()

# Do something with it
comb.async.forEach(asyncArr(), ->
	console.log("Teste")
).then (arr) ->
	console.log(arr) # [1, 2, 3, 4, 5]
