
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

-- Blocks

minetest.register_craft({
	output = "mtz:lum_sand_green",
	type = "shapeless",
  recipe = { "default:sand", "mtz:mycena_powder" },
})

-- TODO: These don't belong in this file

-- Potions

-- for historical reasons categorised as a potion
minetest.register_craft({
    output = "mtz:glow_essence_green",
    recipe = {
        {"", "bucket:bucket_water", ""},
        {"", "mtz:mycena", ""},
        {"", "vessels:glass_bottle", ""},
        },
    replacements = {
        { "bucket:bucket_water", "bucket:bucket_empty" },
    },
})

-- for historical reasons categorised as a potion
minetest.register_craft({
    output = "mtz:glow_essence_blue",
    recipe = {
        {"", "bucket:bucket_water", ""},
        {"", "mtz:lum_sand", ""},
        {"", "vessels:glass_bottle", ""},
        }
})

minetest.register_craft({
    output = "mtz:apple_juice",
    recipe = {
        {"", "default:apple", ""},
        {"", "default:apple", ""},
        {"", "vessels:glass_bottle", ""},
    }
})

-- TODO: These don't belong in this file

-- Concentrates

minetest.register_craftitem("mtz:glowconcentrate", {
	description = "Glow concentrate (neutral)",
	inventory_image = "mtz_testtube_neutral.png",
})
minetest.register_craft({
	output = "mtz:glowconcentrate",
	type = "cooking",
	recipe = "mtz:glow_essence_green",
	cooktime = 4,
})

minetest.register_craftitem("mtz:glowconcentrate_green", {
	description = "Glow concentrate (green)",
	inventory_image = "mtz_testtube_green.png",
})
minetest.register_craft({
	output = "mtz:glowconcentrate_green 4",
	type = "shapeless",
	recipe = { "mtz:testtube_empty", "mtz:mycena_powder", "bucket:bucket_water" }
})
minetest.register_craft({
	output = "mtz:glowconcentrate_green",
	type = "shapeless",
	recipe = { "dye:green", "mtz:glowconcentrate" }
})

minetest.register_craftitem("mtz:glowconcentrate_red", {
	description = "Glow concentrate (red)",
	inventory_image = "mtz_testtube_red.png",
})
minetest.register_craft({
	output = "mtz:glowconcentrate_red",
	type = "shapeless",
	recipe = { "dye:red", "mtz:glowconcentrate" },
})
