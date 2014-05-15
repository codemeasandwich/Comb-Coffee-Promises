comb = require("comb")

when_ = comb.when

asyncArr = ->
	ret = new comb.Promise()
	process.nextTick(ret.callback.bind(ret, [
		name:
			first: when_("Frend")
			last: "Jones"
		age: when_(50)
		roles: ["a", "b", "c"]
	,
		name:
			first: "Bob"
			last: "Yukon"
		age: 40
		roles: when_(["b", "c"])
	,

		name:
			first: "Alice"
			last: "Palace"
		age: when_(35)
		roles: ["c"]
	,

		name:
			first: when_("Johnny")
			last: "P."
		age: 56
		roles: when_([])
	]))
	ret.promise()

array = comb.async.array
array(asyncArr()).pluck("name.first").then (values) ->
	console.log(values) # ["Fred", "Bob", "Alice", "Johnny"]

comb.async.pluck(asyncArr(), "age").then (values) ->
	console.log(values) # [50, 30, 35, 56]
