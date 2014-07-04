
minetest.register_node("mtz:trapstone", {
	description = "Trapstone",
	tiles = {"default_cobble.png"},
	is_ground_content = true,
	walkable = false,
	groups = {cracky=1},
	drop = "default:cobble",
	sounds = default.node_sound_stone_defaults(),

	after_place_node = function(pos, placer, itemstack, pointed_thing)
		local hasprivs = minetest.check_player_privs(placer:get_player_name(), {tester=true})
		if not hasprivs then
			minetest.set_node(pos, {name = "air"})
		end
end})


-- alias to "" so that these items cannot be gained using /giveme etc
minetest.register_alias("mtz:trapstone", "")
