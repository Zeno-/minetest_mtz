
minetest.register_node("mtz:basaltdrystone", {
    description = "Basalt Drystone Cobble",
    tiles = {"mtz_stone_basaltdrystone.png"},
	drop = "mtz:basaltdrystone",
    is_ground_content = true,
    groups = {cracky=2},
    sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("mtz:sanddrystone", {
    description = "Sand Drystone Cobble",
    tiles = {"mtz_stone_sanddrystone.png"},
    is_ground_content = true,
    drop = "mtz:sanddrystone",
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

dofile(mtz.modpath .. "/building/crafts.lua")
