local mycena_interval     = 60--60*10 --60*20
local mycena_chance       = 100
--local mycena_interval     = 60*20
--local mycena_chance       = 3250
local lumsand_interval    = 60*30
local lumsand_chance      = 3500

-- PerlinNoise(seed, octaves, persistence, scale)
--mtz.mycena_noise = PerlinNoise(1481, 4, 0.5, 250)


minetest.register_abm({
		nodenames = {"default:jungletree"},
		interval = mycena_interval,
		chance = mycena_chance,
		action = function(pos, node)
			local destnode = { x = pos.x + 5 - math.random(10), y = pos.y + 3 - math.random(6), z = pos.z + 5 - math.random(10)}
			local name = minetest.get_node(destnode).name
			local nameunder = minetest.get_node({x = destnode.x, y = destnode.y-1, z = destnode.z}).name

			--if name ~= "air" or (nameunder ~= "default:dirt" and nameunder ~= "default:dirt_with_grass") then
			if name ~= "air" or (minetest.get_item_group(nameunder, "soil") == 0) then
				return
			end

			--if not minetest.find_node_near(destnode, 2, "group:soil") then
			--	return
			--end

			--print("N: " .. mtz.mycena_noise:get2d(destnode))

			--local nv = mtz.mycena_noise:get2d({x = destnode.x + 250, y = destnode.y, z = destnode.y + 400})
			--if  nv < -0.72 then return end


			local pos0 = { x = destnode.x-8, y = destnode.y-8, z = destnode.z-8 }
			local pos1 = { x = destnode.x+8, y = destnode.y+8, z = destnode.z+8 }

			local mushcount = minetest.find_nodes_in_area(pos0, pos1, "mtz:mycena")

			if #mushcount > 4 then
					return
			end

			local nodechoices = { "mtz:mycena", "mtz:mycena_2", "mtz:mycena_3", "mtz:mycena_4" }
			local nodename = nodechoices[math.random(1, 4)]
			-- param2 is random rotation by 0 to 179 in steps of 2 degress. Using range 0 to 82
			-- and doubling so that the rotation is in steps of 4
			minetest.set_node(destnode, {name = nodename, param2 = math.random(0, 82)*2})
		end
})

minetest.register_abm({
	nodenames = {"default:dirt", "default:dirt_with_grass"},
	neighbors = {"default:tree", "default:leaves"},
	interval = 60*20,
	chance = 4000,

	action = function(pos, node)
		local destnode = { x = pos.x + 2 - math.random(4), y = pos.y+1, z = pos.z + 2 - math.random(4)}
		local name = minetest.get_node(destnode).name
		local nameunder = minetest.get_node({x = destnode.x, y = destnode.y-1, z = destnode.z}).name

		if name ~= "air" or (nameunder ~= "default:dirt" and nameunder ~= "default:dirt_with_grass") then
				return
		end

		local pos0 = { x = destnode.x-5, y = destnode.y-5, z = destnode.z-5 }
		local pos1 = { x = destnode.x+5, y = destnode.y+5, z = destnode.z+5 }

		local mushcount = minetest.find_nodes_in_area(pos0, pos1,
			{ "mtz:mushroom_a", "mtz:mushroom_a_group" }
		)

		if #mushcount > 2 then
			return
		end

		local nodename
		if math.random() < .2 then
			nodename = "mtz:mushroom_a_group"
		else
			nodename = "mtz:mushroom_a"
		end

		minetest.set_node(destnode, {name = nodename})

end
})

minetest.register_abm({
		nodenames = {"default:sand"},
		interval = lumsand_interval,
		chance =  lumsand_chance,
		action = function(pos, node)
				local name = minetest.get_node(pos).name

				if pos.y > -1 or pos.y < -2 then
						return
				end

				-- print("Spawn lum sand? ")

				-- Lum sand must have at least 1 water on top of it
				if minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name ~= "default:water_source" then
						return
				end

				local pos0 = { x = pos.x-3, y = pos.y-3, z = pos.z-3 }
				local pos1 = { x = pos.x+3, y = pos.y+3, z = pos.z+3 }

				local count = minetest.find_nodes_in_area(pos0, pos1, "mtz:lum_sand")
				if #count == 0 then -- if waterbody not inoculated
						count = minetest.find_nodes_in_area(pos0, pos1, "default:water_source")
						if #count < 9 then -- not enough water
								-- print("not enough water: " .. #wcount)
								return
						end
				end

				-- y+1 checked above for early exit
				local coltop = minetest.get_node({x=pos.x, y=pos.y+3, z=pos.z}).name
				if minetest.get_node({x=pos.x, y=pos.y+2, z=pos.z}).name ~= "default:water_source"
						and (coltop ~= "air" or coltop ~= "default:water_source") then
								return
				end

		local nodechoices = { "mtz:lum_sand", "mtz:lum_sand_2", "mtz:lum_sand_3", "mtz:lum_sand_4" }
		local nodename = nodechoices[math.random(1, 4)]
				minetest.set_node(pos, {name = nodename} )
				-- print(nodename.." spawned at ".. minetest.pos_to_string(pos))

		end
})

