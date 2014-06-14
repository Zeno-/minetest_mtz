

local forgeitems = {
	{ "default:pick_steel", 	"mtz:pick_steel_head",	 "mtz_steel_pick_head.png",   "Steel pickaxe head" },
	{ "default:axe_steel",  	"mtz:axe_steel_head",	 "mtz_steel_axe_head.png",    "Steel axe head" },
	{ "default:shovel_steel",  	"mtz:shovel_steel_head", "mtz_steel_shovel_head.png", "Steel shovel head" },
}

local tooldefs = {
	{ "mtz:pick_forgedsteel",	"mtz:pick_steel_head" },
	{ "mtz:shovel_forgedsteel", "mtz:axe_steel_head" },
	{ "mtz:axe_forgedsteel",	"mtz:axe_steel_head" },
}

-- FIXME: The inventory image of the crafted tools is wrong, because default is 16x16px and mtz_forged_bg.png is 32x32

local toolattrs = {
	{
		description = "Forged Steel Pickaxe",
		inventory_image = "mtz_forged_bg.png^default_tool_steelpick.png",
		wield_image = "default_tool_steelpick.png",
		tool_capabilities = {
			full_punch_interval = 1.0,
			max_drop_level=1,
			groupcaps={
				cracky = {times={[1]=4.00, [2]=1.60, [3]=0.80}, uses=40, maxlevel=2},
			},
			damage_groups = {fleshy=4},
		},
	},
	{
		description = "Forged Steel Shovel",
		inventory_image = "mtz_forged_bg.png^default_tool_steelshovel.png",
		wield_image = "default_tool_steelshovel.png^[transformR90",
		tool_capabilities = {
			full_punch_interval = 1.1,
			max_drop_level=1,
			groupcaps={
				crumbly = {times={[1]=1.50, [2]=0.90, [3]=0.40}, uses=60, maxlevel=2},
			},
			damage_groups = {fleshy=3},
		},
	},
	{
		description = "Forged Steel Axe",
		inventory_image = "mtz_forged_bg.png^default_tool_steelaxe.png",
		wield_image = "default_tool_steelaxe.png",
		tool_capabilities = {
			full_punch_interval = 1.0,
			max_drop_level=1,
			groupcaps={
				choppy={times={[1]=2.50, [2]=1.40, [3]=1.00}, uses=40, maxlevel=2},
			},
			damage_groups = {fleshy=4},
		},
	}
}

-- TODO: Make this a function and call the function from within the loop

for i in ipairs(forgeitems) do
	local inp_item = forgeitems[i][1]
	local out_item = forgeitems[i][2]
	local img = forgeitems[i][3]
	local desc = forgeitems[i][4]
	
	minetest.register_craftitem(out_item, {
		description = desc,
		inventory_image = img
	})
	
	minetest.register_craftitem(out_item.."_forged", {
		description = desc.." forged",
		inventory_image = "mtz_forged_bg.png^"..img
	})
	
	minetest.register_craft({
		type = "shapeless",
		output = out_item,
		recipe = { inp_item },
		replacements = { { inp_item, "default:stick 2" } }
	})
	
	minetest.register_craft({
		type = "cooking",
		output = out_item.."_forged",
		recipe = out_item,
		cooktime = 10
	})
		
	-- TODO: a) Make a function; b) Try and get the base values from the default game and modify them by a %
	for t in ipairs(tooldefs) do
		local name = tooldefs[t][1]
		local head = tooldefs[t][2]
		minetest.register_tool(name, toolattrs[t])
		minetest.register_craft({
			output = name,
			recipe = {
				{'', head, ''},
				{'', 'group:stick', ''},
				{'', 'group:stick', ''},
			}
		})
	end
end
