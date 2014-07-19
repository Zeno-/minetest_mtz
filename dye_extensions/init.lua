
minetest.register_craft({
	output = "dye:white",
	type = "cooking",
	recipe = "mtz:titanium_dust",
	cooktime = 1,
})

minetest.register_craft({
	output = "dye:black 4",
	type = "shapeless",
	recipe = { "default:coal_lump" }
})

minetest.register_craft({
	output = "dye:black 4",
	type = "shapeless",
	recipe = { "mtz:ore_platinum" }
})

minetest.register_craft({
	output = "dye:green",
	type = "shapeless",
	recipe = { "mtz:mycena_powder" }
})

