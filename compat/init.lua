-- Added because I once forgot to remove nature_classic so there are blossom
-- nodes on the map and for whatever reason I don't want to remove them

local BLOSSOM_NODE = "nature:blossom"

local BLOSSOM_TEXTURES = { "default_leaves.png^compat_nature_blossom.png" }

minetest.register_node(":"..BLOSSOM_NODE, {
    description = "Apple blossoms",
    drawtype = "allfaces_optional",
    tiles = BLOSSOM_TEXTURES,
    paramtype = "light",
    groups = { snappy = 3, leafdecay = 3, flammable = 2 },
    sounds = default.node_sound_leaves_defaults(),
	waving = 1
})

minetest.register_craft({
    type = "fuel",
    recipe = BLOSSOM_NODE,
    burntime = 2,
})
