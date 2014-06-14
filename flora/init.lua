
-- Yes, I am aware that fungi are not plants

local mushlight = { 4, 3, 2, 1 }

for i in ipairs(mushlight) do
	if i == 1 then
		nodename = "mtz:mycena"
	else
		nodename = "mtz:mycena_"..i
	end

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
        selection_box = {
            type = "fixed",
            fixed = { -0.15, -0.5, -0.15, 0.15, 0.2, 0.15 },
        },
    })
end

-- The bioluminescent sand (in real life) is -- usually -- the result of
-- _Noctiluca scintillans_. Again, not a plant (it's a protist) but it's in this
-- flora mod until I work out a better place to put it

local sandlight = { 14, 11, 9, 7 }

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

dofile(mtz.modpath.."/flora/abm.lua")
