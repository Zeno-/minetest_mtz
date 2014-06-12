
minetest.register_craft({
    output = "mtz_building:basaltdrystone 5",
    recipe = {
        {"gloopblocks:basalt", "", "gloopblocks:basalt"},
        {"", "gloopblocks:basalt", ""},
        {"gloopblocks:basalt", "", "gloopblocks:basalt"},
        }
})

minetest.register_craft({
    output = "mtz_building:sanddrystone 5",
    recipe = {
        {"default:sandstone", "", "default:sandstone"},
        {"", "default:sandstone", ""},
        {"default:sandstone", "", "default:sandstone"},
        }
})
