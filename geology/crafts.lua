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
