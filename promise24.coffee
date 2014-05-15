comb = require("comb")

asyncArr = ->
	ret = new comb.Promise()
	process.nextTick(ret.callback.bind(ret, [1, 2, 3, 4, 5]))
	ret.promise()

comb.async.some(asyncArr(), (item) ->
	item is 1
).then (every) ->
	console.log(every) # true

comb.async.some(asyncArr(), (item, index) ->
	ret = new comb.Promise()
	process.nextTick ->
		ret.callback(item > 5)
	ret.promise()
).then (arr) ->
	console.log(arr) # false
