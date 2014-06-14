

local forgeitems = {
	{ "default:pick_steel", 	"mtz:pick_steel_head",	 "mtz_steel_pick_head.png",   "Steel pickaxe head" },
	{ "default:axe_steel",  	"mtz:axe_steel_head",	 "mtz_steel_axe_head.png",    "Steel axe head" },
	{ "default:shovel_steel",  	"mtz:shovel_steel_head", "mtz_steel_shovel_head.png", "Steel shovel head" },
}

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
		inventory_image = img
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
end
