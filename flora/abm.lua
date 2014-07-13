local mycena_interval     = 60*20
local mycena_chance       = 3250
local lumsand_interval    = 60*30
local lumsand_chance      = 3500


minetest.register_abm({
		nodenames = {"default:dirt", "default:dirt_with_grass"},
		interval = mycena_interval,
		chance = mycena_chance,
		action = function(pos, node)
				local destnode = { x = pos.x, y = pos.y+1, z = pos.z}
				local name = minetest.get_node(destnode).name

				if (name ~= "air") then
						return
				end

				if not minetest.find_node_near(destnode, 2, "default:jungletree") then
					return
				end

				local pos0 = { x = destnode.x-5, y = destnode.y-5, z = destnode.z-5 }
				local pos1 = { x = destnode.x+5, y = destnode.y+5, z = destnode.z+5 }

				local mushcount = minetest.find_nodes_in_area(pos0, pos1, "mtz_flora:mycena")

				if #mushcount > 2 then
						return
				end

				local nodechoices = { "mtz:mycena", "mtz:mycena_2", "mtz:mycena_3", "mtz:mycena_4" }
				local nodename = nodechoices[math.random(1, 4)]
				minetest.set_node(destnode, {name = nodename})
		end
})

minetest.register_abm({
	nodenames = {"default:dirt", "default:dirt_with_grass"},
	neighbors = {"default:tree", "default:leaves"},
	interval = 60*20,
	chance = 4000,

	action = function(pos, node)
		local destnode = { x = pos.x, y = pos.y+1, z = pos.z}
		local name = minetest.get_node(destnode).name

		if (name ~= "air") then
				return
		end

		local pos0 = { x = destnode.x-4, y = destnode.y-4, z = destnode.z-4 }
		local pos1 = { x = destnode.x+4, y = destnode.y+4, z = destnode.z+4 }

		local mushcount = minetest.find_nodes_in_area(pos0, pos1,
			{ "mtz:mushroom_a", "mtz:mushroom_a_group" }
		)

		if #mushcount > 3 then
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

