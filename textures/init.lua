--[[

Building materials / blocks

Zeno

--]]

mtz_building = {}

mtz_building.modpath = minetest.get_modpath("mtz_building")

minetest.register_node("mtz_building:basaltdrystone", {
    description = "Basalt Drystone Cobble",
    tiles = {"mtz_stone_basaltdrystone.png"},
	drop = "mtz_building:basaltdrystone",
    is_ground_content = true,
    groups = {cracky=2},
    sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("mtz_building:sanddrystone", {
    description = "Sand Drystone Cobble",
    tiles = {"mtz_stone_sanddrystone.png"},
    is_ground_content = true,
    drop = "mtz_building:sanddrystone",
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

dofile(mtz_building.modpath .. "/crafts.lua")

print("[mtz_building] loaded")
