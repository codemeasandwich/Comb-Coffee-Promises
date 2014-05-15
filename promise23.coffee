comb = require("comb")

asynArr = ->
	ret = new comb.Promise()
	process.nextTick(ret.callback.bind(ret, [1, 2, 3, 4, 5]))
	ret.promise()

comb.async.every(asynArr(), (item) ->
	item <= 5
).then (every) ->
	console.log(every) # true

comb.async.every(asynArr(), (item, index) ->
	ret = new comb.Promise()
	process.nextTick ->
		ret.callback(item is 1)

	ret.promise()
).then (arr) ->
	console.log(arr) # False
