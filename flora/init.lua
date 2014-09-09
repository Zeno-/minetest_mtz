
-- Yes, I am aware that fungi are not plants

--local mushlight = { 4, 3, 2, 1 }
local mushlight = { 11, 9, 6, 3 }
local mushscale = { 1.0, 0.90, 0.75, 0.5 }

for i in ipairs(mushlight) do
	if i == 1 then
		nodename = "mtz:mycena"
	else
		nodename = "mtz:mycena_"..i
	end
	local vs = mushscale[i]

	minetest.register_node(nodename, {
			description = "Mycena sp",
			drawtype = "plantlike",
			tiles = { "mtz_fungi_Mycena_sp_single.png" },
			inventory_image = "mtz_fungi_Mycena_sp_single.png",
			wield_image = "mtz_fungi_Mycena_sp_single.png",
			drop = "mtz:mycena",
			sunlight_propagates = true,
			paramtype = "light",
			walkable = false,
			buildable_to = true,
			groups = {	snappy=3, flammable=0, flower=0,
									flora=1, attached_node=1, color_green=1 },
			sounds = default.node_sound_leaves_defaults(),
			light_source = mushlight[i],
			visual_scale = vs,
			selection_box = {
					type = "fixed",
					fixed = { -0.15*vs, -0.5*vs, -0.15*vs, 0.15*vs, 0.2*vs, 0.15*vs },
			},
	})
end

minetest.register_node("mtz:mushroom_a", {
	description = "Mushroom",
	drawtype = "plantlike",
	tiles = { "mtz_mushroom_a_single.png" },
	inventory_image = "mtz_mushroom_a_single.png",
	weild_image = "mtz_mushroom_a_single.png",
	drop = "mtz:mushroom_a",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	groups = {	snappy=3, flammable=0, flower=0,
							flora=1, attached_node=1 },
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
			type = "fixed",
			fixed = { -0.15, -0.5, -0.15, 0.15, 0.2, 0.15 },
	},
	on_use = minetest.item_eat(3),
})

minetest.register_node("mtz:mushroom_a_group", {
	description = "Mushroom",
	drawtype = "plantlike",
	tiles = { "mtz_mushroom_a_group.png" },
	inventory_image = "mtz_mushroom_a_group.png",
	weild_image = "mtz_mushroom_a_group.png",
	drop = "mtz:mushroom_a 3",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	groups = {	snappy=3, flammable=0, flower=0,
							flora=1, attached_node=1 },
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
			type = "fixed",
			fixed = { -0.15, -0.5, -0.15, 0.15, 0.2, 0.15 },
	},
})

-- The bioluminescent sand (in real life) is -- usually -- the result of
-- _Noctiluca scintillans_. Again, not a plant (it's a protist) but it's in
-- flora mod until I work out a better place to put it

local sandlight = { 14, 10, 7, 4 }

for i in ipairs(sandlight) do
	local nodename
	if i == 1 then
		nodename = "mtz:lum_sand"
	else
		nodename = "mtz:lum_sand_"..i
	end

	minetest.register_node(nodename, {
		description = "Bioluminescent Sand",
		drop = "mtz:lum_sand",
		tiles = { "mtz_lum_sand.png" },
		is_ground_content = true,
		groups = { crumbly=3, falling_node=1, sand=1 },
		sounds = default.node_sound_sand_defaults(),
		light_source = sandlight[i],
	})
end

minetest.register_node("mtz:lum_sand_green", {
	description = "Green Bioluminescent Sand",
	drop = "mtz:lum_sand_green",
	tiles = { "mtz_lum_sand_green.png" },
	is_ground_content = true,
	groups = { crumbly=3, falling_node=1, sand=1 },
	sounds = default.node_sound_sand_defaults(),
	light_source = 12,
})

minetest.register_node("mtz:glow_essence_green", {
    description = "Green Glow Essence",
    drawtype = "plantlike",
    tiles = {"mtz_vessels_glass_green.png"},
    inventory_image = "mtz_vessels_glass_green.png",
    wield_image = "mtz_vessels_glass_green.png",
    paramtype = "light",
    walkable = false,
    selection_box = {
      type = "fixed",
      fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
    },
    groups = {vessel=1,dig_immediate=3,attached_node=1},
    sounds = default.node_sound_glass_defaults(),
    light_source = 4,
    on_use = minetest.item_eat(8, "vessels:glass_bottle"),
})

minetest.register_node("mtz:glow_essence_blue", {
    description = "Blue Glow Essence",
    drawtype = "plantlike",
    tiles = {"mtz_vessels_glass_blue.png"},
    inventory_image = "mtz_vessels_glass_blue.png",
    wield_image = "mtz_vessels_glass_blue.png",
    paramtype = "light",
    walkable = false,
    selection_box = {
      type = "fixed",
      fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
    },
    groups = {vessel=1,dig_immediate=3,attached_node=1},
    sounds = default.node_sound_glass_defaults(),
    light_source = 4,
})

minetest.register_node("mtz:apple_juice", {
    description = "Apple Juice",
    drawtype = "plantlike",
    tiles = {"mtz_vessels_applejuice.png"},
    inventory_image = "mtz_vessels_applejuice.png",
    wield_image = "mtz_vessels_applejuice.png",
    paramtype = "light",
    walkable = false,
    selection_box = {
      type = "fixed",
      fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
    },
    groups = {vessel=1,dig_immediate=3,attached_node=1},
    sounds = default.node_sound_glass_defaults(),
    on_use = minetest.item_eat(3, "vessels:glass_bottle"),
})

dofile(mtz.modpath.."/flora/abm.lua")
dofile(mtz.modpath.."/flora/crafts.lua")
