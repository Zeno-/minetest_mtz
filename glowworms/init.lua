local YMIN = -100
local YMAX = 1000

local YMAX_CUTOFF = 500
local YMIN_CUTOFF = -20

minetest.register_node("mtz:glow_worm_green", {
	description = "Green glow worms",
	tiles = {"mtz_glow_worm.png"},
	inventory_image = "mtz_glow_worm.png",
	wield_image = "mtz_glow_worm.png",
	is_ground_content = true,
	groups = {oddly_breakable_by_hand=3},
	light_source = 9,
	paramtype = "light",
	drawtype = "plantlike",
	walkable = false,
	buildable_to = true,
	visual_scale = 1.0,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.5, 0.5},
	},
})

local np_worms = {
	offset = 0,
	scale = 1,
	spread = {x=250, y=250, z=250},
	seed = 5432,
	octaves = 3,
	persist = 0.6
}

minetest.register_on_generated(function(minp, maxp, seed)

	if minp.y > YMAX or maxp.y < YMIN then
		return
	end

	--local t1 = os.clock()


	local c_air = minetest.get_content_id("air")
	local c_stone = minetest.get_content_id("default:stone")
	local c_worm = minetest.get_content_id("mtz:glow_worm_green")

	local x1 = maxp.x
	local y1 = maxp.y
	local z1 = maxp.z
	local x0 = minp.x
	local y0 = minp.y
	local z0 = minp.z

	if (y1 > YMAX_CUTOFF) then
		y1 = YMAX_CUTOFF
	end
	if (y0 < YMIN_CUTOFF) then
		y0 = YMIN_CUTOFF
		if (y0 > y1) then
			return
		end
	end

	--print ("[glowworm_gen] chunk minp ("..x0.." "..y0.." "..z0..")") --tell people you are generating a chunk

	local sidelen = x1 - x0 + 1 --length of a mapblock
	local chulens = {x=sidelen, y=sidelen, z=sidelen} --table of chunk edges
	local minposxz = {x=x0, y=z0} --2D bottom corner

	local noise = minetest.get_perlin_map(np_worms, chulens):get2dMap_flat({x=x0+150, y=z0+50})

	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	local area = VoxelArea:new{MinEdge=emin, MaxEdge=emax}
	local data = vm:get_data()

	local nidx = 1
	local dirty = false

	for z = z0, z1 do
		for y = y0, y1 do
			local vi = area:index(x0, y, z)
			for x = x0, x1 do
				local nv = noise[nidx]
				if  nv >= 0.10 and nv <= 0.40 and math.random() < 0.15 then
					local ai = area:index(x, y + 1, z)
					if data[ai] == c_stone and data[vi] == c_air then
						dirty = true
						local wormheight = math.random(3)
						local destidx = vi
						for i = 0, wormheight - 1 do
							data[destidx] = c_worm
							destidx = area:index(x, y - i - 1, z)
							--destidx = destidx - area.ystride
							if data[destidx] ~= c_air then
								break
							end
						end
					end
				end
				nidx = nidx + 1
				vi = vi + 1
			end
			nidx = nidx - sidelen
		end
		nidx = nidx + sidelen
	end

	if dirty then
		vm:set_data(data)
		vm:calc_lighting()
		vm:write_to_map()
	end

	--local chugent = math.ceil((os.clock() - t1) * 1000)
	--print ("[glowworm_gen] "..chugent.." ms")
end)

print("[glowworm_gen] loaded!")
