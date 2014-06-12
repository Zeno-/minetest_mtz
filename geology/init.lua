minetest.register_craftitem("mtz:orichalcum_gem", {
    description = "Orichalcum Gem",
    inventory_image = "mtz_geol_gem_orichalcum.png",
})

minetest.register_craftitem("mtz:ore_titanium", {
    description = "Titanium Ore",
    inventory_image = "titanium_titanium.png",
})


minetest.register_node("mtz:stone_with_orichalcum", {
    description = "Orichalchum Ore",
    tiles = {"mtz_geol_block_orichalcum.png"},
    is_ground_content = true,
    groups = {cracky=1},
    drop = "mtz:orichalcum_gem",
    sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("mtz:stone_with_titanium", {
    description = "Titanium Ore (in stone)",
    tiles = {"default_stone.png^titanium_titanium_in_ground.png"},
    inventory_image = "default_stone.png^titanium_titanium_in_ground.png",
    is_ground_content = true,
    groups = {cracky=1},
    drop = "mtz:ore_titanium",
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

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "mtz:stone_with_titanium",
    wherein        = "default:stone",
    clust_scarcity = 8*8*8,
    clust_num_ores = 10,
    clust_size     = 7,
    height_min     = -31000,
    height_max     = -100,
    flags          = "absheight",
})

dofile(mtz.modpath .. "/geology/crafts.lua")

