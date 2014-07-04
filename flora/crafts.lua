
-- Inventory only
minetest.register_craftitem("mtz:mycena_powder", {
	description = "Powdered Mycena",
	inventory_image = "mtz_mycena_powder.png",
})

minetest.register_craft({
	output = "mtz:mycena_powder",
	type = "shapeless",
	recipe = { "mtz:mortar_and_pestel", "mtz:mycena" },
	replacements = {
		{ "mtz:mortar_and_pestel", "mtz:mortar_and_pestel" }
	}
})

minetest.register_craft({
	output = "mtz:lum_sand_green",
	type = "shapeless",
  recipe = { "default:sand", "mtz:mycena_powder" },
})
