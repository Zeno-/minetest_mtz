minetest.register_craft({
	output = "mtz:pick_orichalcum",
	recipe = {
		{"mtz:orichalcum_gem", "mtz:orichalcum_gem", "mtz:orichalcum_gem"},
		{"", "mtz:steelrod", ""},
		{"", "mtz:steelrod", ""},
		}
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

minetest.register_craft({
	output = "mtz:axe_orichalcum",
	recipe = {
		{"mtz:orichalcum_gem", "mtz:orichalcum_gem", ""},
		{"mtz:orichalcum_gem", "mtz:steelrod", ""},
		{"", "mtz:steelrod", ""},
		}
})

minetest.register_tool("mtz:axe_orichalcum", {
	description = "Orichalcum axe",
	inventory_image = "mtz_tools_orichalcum_axe.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 3,
		groupcaps = {
			choppy={times={[1]=2.0, [2]=0.90, [3]=0.50}, uses=80, maxlevel=3},
		},
		damage_groups = {fleshy=7},
	},
})

minetest.register_craft({
	output = "mtz:shovel_orichalcum",
	recipe = {
		{"", "mtz:orichalcum_gem", ""},
		{"", "mtz:steelrod", ""},
		{"", "mtz:steelrod", ""},
		}
})

minetest.register_tool("mtz:shovel_orichalcum", {
	description = "Orichalcum shovel",
	inventory_image = "mtz_tools_orichalcum_shovel.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 3,
		groupcaps = {
			crumbly = {times={[1]=1.0, [2]=0.40, [3]=0.30}, uses=80, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
})

