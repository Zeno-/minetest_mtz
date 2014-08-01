minetest.register_privilege("moderator",
        { "Player is a moderator.",
          give_to_singleplayer= false }
)

minetest.register_chatcommand("tprules", {
	params = "",
	description = "Teleport the player to maze spawn point",
	func = function(player, message)
		if not minetest.get_player_privs(player).moderator then
			minetest.chat_send_player(player, "Insufficient privileges", true)
			return
		end
		local tplayer = minetest.get_player_by_name(message)
		if not tplayer then
			minetest.chat_send_player(player, "Unknown player", true)
			return
		end
		tplayer:setpos({x=146, y=182, z=368})
	end
})

minetest.register_chatcommand("whois", {
	params = "",
	description = "Get player ip",
	privs = { moderator = true },
	func = function(player, message)
		local pinfo = minetest.get_player_information(message)
		if not pinfo then
			minetest.chat_send_player(player, "Failed to retrieve player info", true)
			return
		end
		minetest.chat_send_player(player, "IP for " .. message .. " = " .. pinfo.address, true)
	end
})

