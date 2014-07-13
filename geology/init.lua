-------- Orichalcum

minetest.register_craftitem("mtz:orichalcum_gem", {
    description = "Orichalcum Gem",
    inventory_image = "mtz_geol_gem_orichalcum.png",
})

minetest.register_node("mtz:stone_with_orichalcum", {
    description = "Orichalchum Ore",
    tiles = {"mtz_geol_block_orichalcum.png"},
    is_ground_content = true,
    groups = {cracky=1},
    drop = "mtz:orichalcum_gem",
    sounds = default.node_sound_stone_defaults(),
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "mtz:stone_with_orichalcum",
    wherein        = "default:stone",
    clust_scarcity = 18*18*18,
    clust_num_ores = 4,
    clust_size     = 3,
    height_min     = -255,
    height_max     = -128,
    flags          = "absheight",
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "mtz:stone_with_orichalcum",
    wherein        = "default:stone",
    clust_scarcity = 16*16*16,
    clust_num_ores = 6,
    clust_size     = 4,
    height_min     = -31000,
    height_max     = -256,
    flags          = "absheight",
})

-------- Titanium

minetest.register_craftitem("mtz:ore_titanium", {
    description = "Titanium Ore",
    inventory_image = "titanium_titanium.png",
})

minetest.register_node("mtz:stone_with_titanium", {
    description = "Titanium Ore (in stone)",
    tiles = {"default_stone.png^titanium_titanium_in_ground.png"},
    is_ground_content = true,
    groups = {cracky=1},
    drop = "mtz:ore_titanium",
    sounds = default.node_sound_stone_defaults(),
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "mtz:stone_with_titanium",
    wherein        = "default:stone",
    clust_scarcity = 10*10*10,
    clust_num_ores = 10,
    clust_size     = 7,
    height_min     = -31000,
    height_max     = -100,
    flags          = "absheight",
})

-------- Platinum

minetest.register_craftitem("mtz:ore_platinum", {
    description = "Platinum Chunk",
    inventory_image = "minerals_native_platinum.png",
})

minetest.register_node("mtz:stone_with_platinum", {
    description = "Platinum Ore (in stone)",
    tiles = {"default_stone.png^ores_native_platinum.png"},
    is_ground_content = true,
    groups = {cracky=1},
    drop = "mtz:ore_platinum",
    sounds = default.node_sound_stone_defaults(),
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "mtz:stone_with_platinum",
    wherein        = "default:stone",
    clust_scarcity = 18*18*18,
    clust_num_ores = 8,
    clust_size     = 4,
    height_min     = -31000,
    height_max     = -800,
    flags          = "absheight",
})

-- Luminescent marble

minetest.register_node("mtz:marble_glow_red", {
    description = "Luminescent marble (red)",
    tiles = {"mtz_marble_deepred.png"},
    is_ground_content = true,
    groups = {cracky=2, stone=1},
		light_source = 7,
    sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("mtz:marble_glow_green", {
    description = "Luminescent marble (green)",
    tiles = {"mtz_marble_green.png"},
    is_ground_content = true,
    groups = {cracky=2, stone=1},
		light_source = 7,
    sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("mtz:marble_glow_blue", {
    description = "Luminescent marble (blue)",
    tiles = {"mtz_marble_blue.png"},
    is_ground_content = true,
    groups = {cracky=2, stone=1},
		light_source = 7,
    sounds = default.node_sound_stone_defaults(),
})

dofile(mtz.modpath .. "/geology/crafts.lua")

