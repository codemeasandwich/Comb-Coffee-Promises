comb = require("comb")

asyncArr = ->
	ret = new comb.Promise()
	process.nextTick(ret.callback.bind(ret, [1, 2, 3, 4, 5]))
	ret.promise()

comb.async.filter(asyncArr(), (item) ->
	item % 2
).then (arr) ->
	console.log(arr) # [1, 3, 5]

comb.async.filter(asyncArr(), (item, index) ->
	ret = new comb.Promise()
	process.nextTick ->
		ret.callback(item % 2)

	ret.promise()
).then (arr) ->
	console.log(arr) # [1, 3, 5]
