

local dismantle_items = {
	{
		parenttool 	= "default:pick_steel",
		toolhead	= "mtz:pick_steel_head",
		img  		= "mtz_steel_pick_head.png",
		desc 		= "Steel pickaxe head"
	},
	{
		parenttool 	= "default:axe_steel",
		toolhead	= "mtz:axe_steel_head",	
		img			= "mtz_steel_axe_head.png",
		desc		= "Steel axe head"
	},
	{
		parenttool 	= "default:shovel_steel",
		toolhead	= "mtz:shovel_steel_head",
		img			= "mtz_steel_shovel_head.png",
		desc		= "Steel shovel head"
	}
}

local tooldefs = {
	{ name 		= "mtz:pick_temperedsteel",
		recipe		= {
			{ "", "mtz:pick_steel_head_tempered", "" },
			{ "", "default:stick", "" },
			{ "", "default:stick", "" }
		}
	},
	{ name = "mtz:shovel_temperedsteel",
		recipe = {
			{ "", "mtz:shovel_steel_head_tempered", "" },
			{ "", "default:stick", "" },
			{ "", "default:stick", "" }
		}
	},
	{ name = "mtz:axe_temperedsteel",
		recipe = {
			{ "", "mtz:axe_steel_head_tempered", "" },
			{ "", "default:stick", "" },
			{ "", "default:stick", "" }
		}
	}
}

-- FIXME: The inventory image of the crafted tools is wrong, because default is 16x16px and mtz_tempered_bg.png is 32x32

local toolattrs = {
	{
		description = "Tempered Steel Pickaxe",
		inventory_image = "mtz_tempered_bg.png^mtz_tool_steelpick.png",
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
		description = "Tempered Steel Shovel",
		inventory_image = "mtz_tempered_bg.png^mtz_tool_steelshovel.png",
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
		description = "Tempered Steel Axe",
		inventory_image = "mtz_tempered_bg.png^mtz_tool_steelaxe.png",
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

for _, curritem in ipairs(dismantle_items) do
	minetest.register_craftitem(curritem.toolhead, {
		description = curritem.desc,
		inventory_image = curritem.img
	})
	
	minetest.register_craftitem(curritem.toolhead.."_tempered", {
		description = curritem.desc.." tempered",
		inventory_image = "mtz_tempered_bg.png^"..curritem.img
	})
	
	minetest.register_craft({
		type = "shapeless",
		output = curritem.toolhead,
		recipe = { curritem.parenttool },
		replacements = { { curritem.parenttool, "default:stick 2" } }
	})
	
	minetest.register_craft({
		type = "cooking",
		output = curritem.toolhead.."_tempered",
		recipe = curritem.toolhead,
		cooktime = 10
	})
		
	-- TODO: a) Make a function; b) Try and get the base values from the default game and modify them by a %
	for t, tool in ipairs(tooldefs) do
		minetest.register_tool(tool.name, toolattrs[t])
		minetest.register_craft({
			output = tool.name,
			recipe = tool.recipe
		})
	end
end
