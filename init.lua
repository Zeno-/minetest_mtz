mtz = {}

mtz.modpath = minetest.get_modpath("mtz")

minetest.register_alias("mtz_flora:mycena",                  "mtz:mycena")
minetest.register_alias("mtz_flora:lum_sand",                "mtz:lum_sand")

minetest.register_alias("mtz_geology:orichalcum_gem",        "mtz_orichalcum_gem")
minetest.register_alias("mtz_geology:stone_with_orichalcum", "mtz:stone_with_orichalcum")
minetest.register_alias("mtz_geology:rod_steel",             "mtz:steelrod")
minetest.register_alias("mtz_geology:pick_orichalcum",       "mtz:pick_orichalcum")

minetest.register_alias("mtz_vessels:glow_essence_green",    "mtz:glow_essence_green")
minetest.register_alias("mtz_vessels:glow_essence_blue",     "mtz:glow_essence_blue")
minetest.register_alias("mtz_vessels:apple_juice",           "mtz:apple_juice")
minetest.register_alias("mtz_vessels:mortar_and_pestel",     "mtz:mortar_and_pestel")

minetest.register_alias("mtz_building:basaltdrystone",       "mtz:basaltdrystone")
minetest.register_alias("mtz_building:sanddrystone",         "mtz:sanddrystone")


minetest.register_alias("mtz_tests:treespawner",             "mtz:test_treespawner")

dofile(mtz.modpath.."/flora/init.lua")
dofile(mtz.modpath.."/geology/init.lua")
dofile(mtz.modpath.."/tests/init.lua")
dofile(mtz.modpath.."/vessels/init.lua")
dofile(mtz.modpath.."/building/init.lua")
