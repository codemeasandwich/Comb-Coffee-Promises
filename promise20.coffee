comb = require("comb")

asyncArr = ->
	ret = new comb.Promise()
	process.nextTick(ret.callback.bind(ret, [1, 2, 3, 4, 5]))
	ret.promise()

comb.async.map(asyncArr(), (item) ->
	item * 2
).then (arr) ->
	console.log(arr) # [2, 4, 6, 8, 10]
