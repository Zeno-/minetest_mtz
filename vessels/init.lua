
----------------------------- INVENTORY ONLY ---------------------------------

minetest.register_craftitem("mtz:mortar_and_pestel", {
	description = "Mortar and Pestel",
	inventory_image = "mtz_mortar_and_pestel.png",
})

minetest.register_craft({
    output = "mtz:mortar_and_pestel",
    recipe = {
        {"default:stone", "", "default:stone"},
        {"", "default:stone", ""},
        {"default:stone", "default:stone", "default:stone"},
        }
})

minetest.register_craftitem("mtz:testtube_empty", {
	description = "Test tube (empty) ",
	inventory_image = "mtz_testtube_empty.png",
})

minetest.register_craft({
    output = "mtz:testtube_empty",
    recipe = {
        {"", "default:glass", ""},
        {"", "default:glass", ""},
        {"", "default:glass", ""},
        }
})
