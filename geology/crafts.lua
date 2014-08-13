-- Luminescent marble

minetest.register_craft({
	output = "mtz:marble_glow_red",
	type = "shapeless",
  recipe = { "mtz:glowconcentrate_red", "morestones:marble" },
})

minetest.register_craft({
	output = "mtz:marble_glow_green",
	type = "shapeless",
  recipe = { "mtz:glowconcentrate_green", "morestones:marble" },
})

minetest.register_craft({
	output = "mtz:marble_glow_blue",
	type = "shapeless",
  recipe = { "mtz:glowconcentrate_blue", "morestones:marble" },
})


minetest.register_craftitem("mtz:titanium_dust", {
	description = "Titanium dust",
	inventory_image = "mtz_titanium_dust.png",
})

minetest.register_craft({
	output = "mtz:titanium_dust 4",
	type = "shapeless",
	recipe = { "mtz:mortar_and_pestel", "mtz:ore_titanium" },
	replacements = {
		{ "mtz:mortar_and_pestel", "mtz:mortar_and_pestel" }
	}
})

minetest.register_craftitem("mtz:platinum_ingot", {
	description = "Platinum ingot",
	inventory_image = "mtz_platinum_ingot.png",
})

minetest.register_craft({
	output = "mtz:platinum_ingot",
	type = "cooking",
	recipe = "mtz:ore_platinum",
	cooktime = 3,
})

minetest.register_craftitem("mtz:platinum_coin_1", {
	description = "One Samwich",
	inventory_image = "mtz_platinum_coin_1.png",
	stack_max = 10000,
})

minetest.register_craft({
	output = "mtz:platinum_coin_1 9",
	type = "shapeless",
	recipe = { "mtz:platinum_ingot" },
})
