comb = require("comb")

asyncArr = ->
	ret = new comb.Promise()
	process.nextTick(ret.callback.bind(ret, [1, 2, 3, 4, 5]))
	ret.promise()

myNewArr = []
comb.async.forEach(asyncArr(), (item, index) ->
	ret = new comb.Promise()
	process.nextTick ->
		myNewArr.push([item, index])
		ret.callback()

	ret.promise()
).then ->
	console.log(myNewArr) # [[1,0], [2,1], [3,2], [4,3], [5,4]]
