minetest.register_node("mtz:tbear", {
	description = "Teddybear",
	drawtype = "plantlike",
	tiles = { "mtz_tbear.png" },
	inventory_image = "mtz_tbear.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {	snappy=3, flammable=0, flower=0, attached_node=1 },
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
			type = "fixed",
			fixed = { -0.15, -0.5, -0.15, 0.15, 0.2, 0.15 },
	},
})

minetest.register_craft({
    output = "mtz:tbear",
    recipe = {
        {"wool:brown", "wool:brown", "wool:brown"},
        {"default:coal_lump", "wool:brown", "default:coal_lump"},
        {"wool:brown", "wool:brown", "wool:brown"},
        }
})
