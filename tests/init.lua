local experimental_tree = {
	axiom="/ FFF[ccc] A FF /// [C^^D^D^D] /// [C^^D^D^D] /// [c^^d^d^d] &&&&& / ///B ///B ///B",
	rules_a = "[&&TTTTTT[d]TTT[b]&TTT]////[&&TTTTTT[d]TTT[b]&TTT]////[&&TTTTTT[d]TTT[b]&TTT]",
	rules_b = "[^^^^+++***TT[d]TTb[d]^TTT^F [c]d][^^^^+++///TT[d]TTb[d]^TTT^F [c]d][^^^^++++///TT[d]TTb[d]^TTT^F [c]d]",
	rules_c = "&&&&FfF [D]",
	rules_d = "//FFf",

	trunk="default:jungletree",
	leaves="default:jungleleaves",
	angle=30,
	iterations=3,
	random_level=3,
	trunk_type="crossed",
	thin_branches=true
}

minetest.register_craftitem("mtz:test_treespawner", {
	description = "Test Experimental Tree",
	inventory_image = "default_stick.png",
	on_use = function(itemstack, user, pointed_thing)
		local hasprivs = minetest.check_player_privs(user:get_player_name(), {tester=true})

		if hasprivs == true and pointed_thing.type == "node" then
				local pos = pointed_thing.above
				experimental_tree.seed = math.random(0, 32767)
				minetest.env:spawn_tree(pos, experimental_tree)
		end
	end
})

