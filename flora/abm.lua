local mycena_interval     = 60*4
local mycena_chance       = 250
local lumsand_interval    = 60*8
local lumsand_chance      = 500

minetest.register_abm({
    nodenames = {"default:dirt", "default:dirt_with_grass"},
    interval = mycena_interval,
    chance = mycena_chance,
    action = function(pos, node)
        local destnode = { x = pos.x, y = pos.y+1, z = pos.z}
        local name = minetest.get_node(destnode).name       
        local nodedef = minetest.registered_nodes[name]
        
        if not nodedef then
            return
        end

        local pos0 = { x = destnode.x-4, y = destnode.y-4, z = destnode.z-4 }
        local pos1 = { x = destnode.x+4, y = destnode.y+4, z = destnode.z+4 }

        local mushcount = minetest.find_nodes_in_area(pos0, pos1, "mtz_flora:mycena")
        local maxmushrooms = math.random(1, 5)
        if #mushcount > maxmushrooms then
            return
        end

        if minetest.find_node_near(destnode, 3, "default:jungletree") then
            if name == "air" then
            		local nodechoices = { "mtz:mycena", "mtz:mycena_2", "mtz:mycena_3", "mtz:mycena_4" }
                    local nodename = nodechoices[math.random(1, 4)]
                    minetest.set_node(destnode, {name = nodename})
                    -- print("Mycena spawned at ".. minetest.pos_to_string(pos))
            end
        end
    end
})

minetest.register_abm({
    nodenames = {"default:sand"},
    interval = lumsand_interval,
    chance =  lumsand_chance,
    action = function(pos, node)
        local name = minetest.get_node(pos).name       
        local nodedef = minetest.registered_nodes[name]
        
        if not nodedef then
            return
        end

        local pos0 = { x = pos.x-3, y = pos.y-3, z = pos.z-3 }
        local pos1 = { x = pos.x+3, y = pos.y+3, z = pos.z+3 }
        
        local count = minetest.find_nodes_in_area(pos0, pos1, "mtz:lum_sand")
        if #count == 0 then -- if waterbody not inoculated
            count = minetest.find_nodes_in_area(pos0, pos1, "default:water_source")
            if #count < 9 then -- not enough water
            --    print("not enough water: " .. #wcount)
                return
            end
        end

        for i = 1, 3 do
           if minetest.get_node({x=pos.x, y=pos.y+i, z=pos.z}).name ~= "default:water_source" then
               return
           end
        end
        if minetest.get_node({x=pos.x, y=pos.y+4, z=pos.z}).name ~= "air" then
            return
        end
        
		local nodechoices = { "mtz:lum_sand", "mtz:lum_sand_2", "mtz:lum_sand_3", "mtz:lum_sand_4" }
		local nodename = nodechoices[math.random(1, 4)]
        minetest.set_node(pos, {name = nodename} )
        -- print(nodename.." spawned at ".. minetest.pos_to_string(pos))

    end
})
