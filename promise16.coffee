comb = require("comb")

asyncAction = (item, timeout) ->
	ret = new comb.Promise()
	setTimeout(ret.callback.bind(ret, item), timeout)
	ret.promise()

comb.serial([
	comb.partial(asyncAction, 1, 1000),
	comb.partial(asyncAction, 2, 900),
	comb.partial(asyncAction, 3, 800),
	comb.partial(asyncAction, 4, 700),
	comb.partial(asyncAction, 5, 600),
	comb.partial(asyncAction, 6, 500)]).then (results) ->
	console.log(results) # [1, 2, 3, 4, 5, 6]
