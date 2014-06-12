
minetest.register_craft({
    output = "mtz:basaltdrystone 5",
    recipe = {
        {"gloopblocks:basalt", "", "gloopblocks:basalt"},
        {"", "gloopblocks:basalt", ""},
        {"gloopblocks:basalt", "", "gloopblocks:basalt"},
        }
})

minetest.register_craft({
    output = "mtz:sanddrystone 5",
    recipe = {
        {"default:sandstone", "", "default:sandstone"},
        {"", "default:sandstone", ""},
        {"default:sandstone", "", "default:sandstone"},
        }
})
