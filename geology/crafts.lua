
-- TODO: The tools should really be in their own file (at least), or better
--       still, in a separate mod

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

minetest.register_craft({
    output = "mtz:pick_orichalcum",
    recipe = {
        {"mtz:orichalcum_gem", "mtz:orichalcum_gem", "mtz:orichalcum_gem"},
        {"", "mtz:steelrod", ""},
        {"", "mtz:steelrod", ""},
        }
})

minetest.register_craft({
	output = "mtz:marble_glow_red",
	type = "shapeless",
  recipe = { "mtz:glowconcentrate_red", "morestones:marble" },
})

minetest.register_tool("mtz:pick_orichalcum", {
    description = "Orichalcum Pickaxe",
    inventory_image = "mtz_tools_orichalcum_pick.png",
    tool_capabilities = {
        full_punch_interval = 0.9,
        max_drop_level = 3,
        groupcaps = {
            cracky = {times={[1]=1.7, [2]=0.7, [3]=0.4}, uses=100, maxlevel=3},
        },
        damage_groups = {fleshy=5},
    },
})


