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

