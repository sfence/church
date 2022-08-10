--------------------
-- Register Nodes
--------------------

local glass_sounds = nil
if minetest.get_modpath("sounds") then
	glass_sounds = sounds.node_glass()
elseif minetest.get_modpath("default") then
	glass_sounds = default.node_sound_glass_defaults()
elseif minetest.get_modpath("hades_sounds") then
	glass_sounds = hades_sounds.node_sound_glass_defaults()
end

for _, c in pairs({"blue", "green", "red", "violet"}) do
	minetest.register_node("church_glass:church_glass_"..c, {
		description = c.." Stained Glass",
		use_texture_alpha = true,
		inventory_image = "church_glass_"..c..".png",
		--wield_image = "church_glass_itemname.png",
		tiles = {
			"church_glass_sides.png",
			"church_glass_sides.png",
			"church_glass_sides.png",
			"church_glass_sides.png",
			"church_glass_"..c..".png^[transformFX",
			"church_glass_"..c..".png"
		},
		drawtype = "nodebox",
		sunlight_propagates = true,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		light_source = 5,
		groups = {snappy=3,choppy=3,cracky=3,crumbly=3, oddly_breakable_by_hand=3},
		sounds = glass_sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.05, 0.5, 0.5, 0.05},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.05, 0.5, 0.5, 0.05},
			},
		},
	})

	minetest.register_node("church_glass:church_glass_"..c.."_fancy", {
		description = c.." Stained Glass",
		use_texture_alpha = true,
		inventory_image = "church_glass_"..c.."_fancy.png",
		--wield_image = "church_glass_itemname.png",
		tiles = {
			"church_glass_sides.png",
			"church_glass_sides.png",
			"church_glass_sides.png",
			"church_glass_sides.png",
			"church_glass_"..c.."_fancy.png^[transformFX",
			"church_glass_"..c.."_fancy.png"
		},
		drawtype = "nodebox",
		sunlight_propagates = true,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		light_source = 5,
		groups = {snappy=3,choppy=3,cracky=3,crumbly=3, oddly_breakable_by_hand=3},
		sounds = glass_sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.05, 0.5, 0.5, 0.05},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.05, 0.5, 0.5, 0.05},
			},
		},
	})
-----------------------------
-- Register Craft Recipes
-----------------------------
	minetest.register_craft({
		output = "church_glass:church_glass_"..c.." 4",
		recipe = {
			{ "dye:"..c, "default:copper_lump", "dye:"..c },
			{ "default:copper_lump", "default:glass", "default:copper_lump" },
			{ "dye:"..c, "default:copper_lump", "dye:"..c },
		}
	})

	minetest.register_craft({
		output = "church_glass:church_glass_"..c.."_fancy 4",
		recipe = {
			{ "default:copper_lump", "dye:"..c, "default:copper_lump" },
			{ "dye:"..c, "default:glass", "dye:"..c },
			{ "default:copper_lump", "dye:"..c, "default:copper_lump" },
		}
	})

end
