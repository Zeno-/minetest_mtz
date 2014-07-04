
minetest.register_node("mtz:glow_essence_green", {
    description = "Green Glow Essence",
    drawtype = "plantlike",
    tiles = {"mtz_vessels_glass_green.png"},
    inventory_image = "mtz_vessels_glass_green.png",
    wield_image = "mtz_vessels_glass_green.png",
    paramtype = "light",
    walkable = false,
    selection_box = {
      type = "fixed",
      fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
    },
    groups = {vessel=1,dig_immediate=3,attached_node=1},
    sounds = default.node_sound_glass_defaults(),
    light_source = 4,
    on_use = minetest.item_eat(8, "vessels:glass_bottle"),
})

minetest.register_node("mtz:glow_essence_blue", {
    description = "Blue Glow Essence",
    drawtype = "plantlike",
    tiles = {"mtz_vessels_glass_blue.png"},
    inventory_image = "mtz_vessels_glass_blue.png",
    wield_image = "mtz_vessels_glass_blue.png",
    paramtype = "light",
    walkable = false,
    selection_box = {
      type = "fixed",
      fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
    },
    groups = {vessel=1,dig_immediate=3,attached_node=1},
    sounds = default.node_sound_glass_defaults(),
    light_source = 4,
})

minetest.register_node("mtz:apple_juice", {
    description = "Apple Juice",
    drawtype = "plantlike",
    tiles = {"mtz_vessels_applejuice.png"},
    inventory_image = "mtz_vessels_applejuice.png",
    wield_image = "mtz_vessels_applejuice.png",
    paramtype = "light",
    walkable = false,
    selection_box = {
      type = "fixed",
      fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
    },
    groups = {vessel=1,dig_immediate=3,attached_node=1},
    sounds = default.node_sound_glass_defaults(),
    on_use = minetest.item_eat(3, "vessels:glass_bottle"),
})

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

----------------------------- INVENTORY ONLY ---------------------------------

minetest.register_craftitem("mtz:mortar_and_pestel", {
	description = "Mortar and Pestel",
	inventory_image = "mtz_mortar_and_pestel.png",
})

minetest.register_craft({
    output = "mtz:mortar_and_pestel",
    recipe = {
        {"default:stone", "", "default:stone"},
        {"", "default:stone", ""},
        {"default:stone", "default:stone", "default:stone"},
        }
})
