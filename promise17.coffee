comb = require('comb')

asyncAction = (add, timeout) ->
	(num) ->
		num = num or 0
		ret = new comb.Promise()
		setTimeout( (->
			ret.callback(num + add)
		), timeout)
		ret

comb.chain([
	asyncAction(1, 100),
	asyncAction(2, 100),
	asyncAction(3, 100),
	asyncAction(4, 100),
	asyncAction(5, 100)]).then ((results) ->
	console.log(results) # 15
	)
