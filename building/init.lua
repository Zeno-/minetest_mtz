
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

-- Stairs and slabs

-- desc, subname, parentitemstring, baseimage, crackyness
local stairandslabs = {
	{ "Basalt Drystone Cobble", "basaltdrystone", "mtz:basaltdrystone",  "mtz_stone_basaltdrystone.png",  2},
	{ "Sand Drystone Cobble", 	"sanddrystone",	  "mtz:sanddrystone",    "mtz_stone_sanddrystone.png",  3},
}

for i in ipairs(stairandslabs) do
	local desc = stairandslabs[i][1]
	local subname = stairandslabs[i][2]
	local parent = stairandslabs[i][3]
	local img = stairandslabs[i][4]
	local crack = stairandslabs[i][5]
	
	stairs.register_stair_and_slab(
		subname, parent,
		{cracky = crack },
		{img},
		desc.." Stair",
		desc.." Slab"
	)
end

dofile(mtz.modpath .. "/building/crafts.lua")
