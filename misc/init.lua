minetest.register_craftitem("mtz:steelrod", {
    description = "Steel Rod",
    inventory_image = "mtz_metals_steelrod.png",
})
minetest.register_craft({
    output = "mtz:steelrod 9",
    recipe = {
        {"", "default:steel_ingot", ""},
        {"", "default:steel_ingot", ""},
        {"", "default:steel_ingot", ""},
        }
})

minetest.register_node("mtz:baconandeggs", {
	description = "Bacon and Eggs",
	drawtype = "plantlike",
	tiles = { "bande32.png" },
	inventory_image = "bande32.png",
	weild_image = "bande32.png",
	drop = "mtz:baconandeggs",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	groups = {	snappy=3, flammable=0, flower=0,
							flora=1, attached_node=1 },
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
			type = "fixed",
			fixed = { -0.15, -0.5, -0.15, 0.15, 0.2, 0.15 },
	},
	on_use = minetest.item_eat(16),
})
