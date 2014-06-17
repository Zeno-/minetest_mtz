
local TEMPERED_SUFFIX = "_tempered"
local TEMPERED_PREFIX_DESC = "Tempered "

-- ============================================================================
-- Default tools that can be dismantled (into tooldhead + handle) and re-forged

local dismantle_items = {
	{
		parenttool 	= "default:pick_steel",
		toolhead	= "mtz:pick_steel_head",
		img  		= "mtz_steel_pick_head.png",
		desc 		= "Steel pickaxe head"
	},
	{
		parenttool 	= "default:axe_steel",
		toolhead	= "mtz:axe_steel_head",	
		img			= "mtz_steel_axe_head.png",
		desc		= "Steel axe head"
	},
	{
		parenttool 	= "default:shovel_steel",
		toolhead	= "mtz:shovel_steel_head",
		img			= "mtz_steel_shovel_head.png",
		desc		= "Steel shovel head"
	}
}

-- Recipes and specs for tempered tools
local tooldefs = {
	{ name 		= "mtz:pick_temperedsteel",
		recipe		= {
			{ "", "mtz:pick_steel_head"..TEMPERED_SUFFIX, "" },
			{ "", "default:stick", "" },
			{ "", "default:stick", "" }
		},
    specs = {
      description = TEMPERED_PREFIX_DESC.."Steel Pickaxe",
      inventory_image = "mtz_tempered_bg.png^mtz_tool_steelpick.png",
      wield_image = "default_tool_steelpick.png",
      tool_capabilities = {
        full_punch_interval = 1.0,
        max_drop_level=1,
        groupcaps={
          cracky = {times={[1]=3.5, [2]=1.60, [3]=0.80}, uses=40, maxlevel=2},
        },
        damage_groups = {fleshy=4},
    },
  },
	},
	{ name = "mtz:shovel_temperedsteel",
		recipe = {
			{ "", "mtz:shovel_steel_head"..TEMPERED_SUFFIX, "" },
			{ "", "default:stick", "" },
			{ "", "default:stick", "" }
		},
    specs = {
      description = TEMPERED_PREFIX_DESC.."Steel Shovel",
      inventory_image = "mtz_tempered_bg.png^mtz_tool_steelshovel.png",
      wield_image = "default_tool_steelshovel.png^[transformR90",
      tool_capabilities = {
        full_punch_interval = 1.1,
        max_drop_level=1,
        groupcaps={
          crumbly = {times={[1]=1.50, [2]=0.90, [3]=0.40}, uses=60, maxlevel=2},
        },
        damage_groups = {fleshy=3},
      },
    },
	},
	{ name = "mtz:axe_temperedsteel",
		recipe = {
			{ "", "mtz:axe_steel_head"..TEMPERED_SUFFIX, "" },
			{ "", "default:stick", "" },
			{ "", "default:stick", "" }
		},
    specs =  {
      description = TEMPERED_PREFIX_DESC.."Steel Axe",
      inventory_image = "mtz_tempered_bg.png^mtz_tool_steelaxe.png",
      wield_image = "default_tool_steelaxe.png",
      tool_capabilities = {
        full_punch_interval = 1.0,
        max_drop_level=1,
        groupcaps={
          choppy={times={[1]=2.50, [2]=1.40, [3]=1.00}, uses=40, maxlevel=2},
        },
        damage_groups = {fleshy=4},
      },
    }
	}
}

-- ============================================================================

local custom = {
  -- These first 3 aren't really custom, but alternative crafts for the steel
  -- tool heads (instead of having to craft the original tool and then 
  -- dismantle it
  { name  = "mtz:pick_steel_head",
    img = "mtz_steel_pick_head.png",
    desc = "Steel Pick Head",
    craft = {
      output = "mtz:pick_steel_head",
      recipe = { 
        {"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"}
      }
    },
    tempertime = 10
  },
  { name  = "mtz:axe_steel_head",
    img = "mtz_steel_axe_head.png",
    desc = "Steel axe head",
    craft = {
      output = "mtz:axe_steel_head",
      recipe = { 
        {"default:steel_ingot", "default:steel_ingot", ""},
        {"default:steel_ingot", "", ""},
      }
    },
    tempertime = 10
  },
  { name  = "mtz:shovel_steel_head",
    img = "mtz_shovel_axe_head.png",
    desc = "Steel shovel head",
    craft = {
      output = "mtz:shovel_steel_head",
      recipe = { 
        {"", "default:steel_ingot", ""},
        {"default:steel_ingot", "", "default:steel_ingot"},
      }
    },
    tempertime = 10
  },
  
  -- Titanium *coated* steel pick
  -- Slightly lighter than tempered steel and a bit stronger (not heaps)
  { name  = "mtz:pick_steeltitanium_head",
    img = "mtz_steel_pick_head.png",
    desc = "Titanium Coated Pick Head",
    craft = {
      output = "mtz:pick_steeltitanium_head",
      recipe = { 
        {"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
        {"", "", ""},
        {"", "", "mtz:ore_titanium"},
      }
    },
    tempertime = 10,
    tooldef = {
      name = "mtz:pick_titaniumcoated",
      recipe = {
        { "", "mtz:pick_steeltitanium_head"..TEMPERED_SUFFIX, "" },
        { "", "default:stick", "" },
        { "", "default:stick", "" }
      },
      specs =  {
        description = TEMPERED_PREFIX_DESC.."Titanium Coated Pick",
        inventory_image = "mtz_tempered_bg.png^mtz_tool_steelpick.png",
        wield_image = "default_tool_steelpick.png",
        tool_capabilities = {
          full_punch_interval = 0.95,
          max_drop_level=1,
          groupcaps={
            cracky = {times={[1]=3.25, [2]=1.60, [3]=0.80}, uses=45, maxlevel=2},
          },
          damage_groups = {fleshy=4},
        }
      }
    }
  },

  -- Titanium *coated* steel axe
  -- Slightly lighter than tempered steel and a bit stronger (not heaps)
  { name  = "mtz:axe_steeltitanium_head",
    img = "mtz_steel_axe_head.png",
    desc = "Titanium Coated Axe Head",
    craft = {
      output = "mtz:axe_steeltitanium_head",
      recipe = { 
        {"default:steel_ingot", "default:steel_ingot", ""},
        {"default:steel_ingot", "", ""},
        {"", "", "mtz:ore_titanium"}
      }
    },
    tempertime = 10,
    tooldef = {
      name = "mtz:axe_titaniumcoated",
      recipe = { 
        { "", "mtz:axe_steeltitanium_head"..TEMPERED_SUFFIX, "" },
        { "", "default:stick", "" },
        { "", "default:stick", "" }
      },
      specs =  {
        description = TEMPERED_PREFIX_DESC.."Titanium Coated Axe",
        inventory_image = "mtz_tempered_bg.png^mtz_tool_steelaxe.png",
        wield_image = "default_tool_steelaxe.png",
        tool_capabilities = {
          full_punch_interval = 0.95,
          max_drop_level=1,
          groupcaps={
            choppy={times={[1]=2.50, [2]=1.25, [3]=0.75}, uses=45, maxlevel=2},
          },
          damage_groups = {fleshy=4},
        },
      }
    }
  },
  
  -- Titanium pick
  { name  = "mtz:pick_titanium_head",
    img = "mtz_steel_pick_head.png",
    desc = "Titanium Pickaxe Head",
    craft = {
      output = "mtz:pick_titanium_head",
      recipe = { 
        {"mtz:ore_titanium", "mtz:ore_titanium", "mtz:ore_titanium"},
        {"", "", ""},
        {"", "", ""},
      }
    },
    tempertime = 15,
    tooldef = {
      name = "mtz:pick_titanium",
      recipe = {
        { "", "mtz:pick_titanium_head"..TEMPERED_SUFFIX, "" },
        { "", "default:stick", "" },
        { "", "default:stick", "" }
      },
      specs =  {
        description = TEMPERED_PREFIX_DESC.."Titanium Pick",
        inventory_image = "mtz_tempered_bg.png^mtz_tool_steelpick.png",
        wield_image = "default_tool_steelpick.png",
        tool_capabilities = {
          full_punch_interval = 0.9,
          max_drop_level=1,
          groupcaps={
            cracky = {times={[1]=2.75, [2]=1.60, [3]=0.80}, uses=45, maxlevel=3},
          },
          damage_groups = {fleshy=4},
        }
      }
    }
  },
  
  -- Titanium axe
  { name  = "mtz:axe_titanium_head",
    img = "mtz_steel_axe_head.png",
    desc = "Titanium Axe Head",
    craft = {
      output = "mtz:axe_titanium_head",
      recipe = { 
        {"mtz:ore_titanium", "mtz:ore_titanium", ""},
        {"mtz:ore_titanium", "", ""},
        {"", "", ""}
      }
    },
    tempertime = 10,
    tooldef = {
      name = "mtz:axe_titanium",
      recipe = { 
        { "", "mtz:axe_titanium_head"..TEMPERED_SUFFIX, "" },
        { "", "default:stick", "" },
        { "", "default:stick", "" }
      },
      specs =  {
        description = TEMPERED_PREFIX_DESC.."Titanium Axe",
        inventory_image = "mtz_tempered_bg.png^mtz_tool_steelaxe.png",
        wield_image = "default_tool_steelaxe.png",
        tool_capabilities = {
          full_punch_interval = 0.95,
          max_drop_level=1,
          groupcaps={
            choppy={times={[1]=2.5, [2]=1.0, [3]=0.65}, uses=45, maxlevel=3},
          },
          damage_groups = {fleshy=4},
        },
      }
    }
  },
  
}

-- ============================================================================

-- Create tool-head craft items for the default tools in dismantle_items
local function create_toolhead_from_base(baseitem)
    minetest.register_craftitem(baseitem.toolhead, {
      description = baseitem.desc,
      inventory_image = baseitem.img
    })
    
    minetest.register_craftitem(baseitem.toolhead..TEMPERED_SUFFIX, {
      description = TEMPERED_PREFIX_DESC..baseitem.desc,
      inventory_image = "mtz_tempered_bg.png^"..baseitem.img
    })
    
    minetest.register_craft({
      type = "shapeless",
      output = baseitem.toolhead,
      recipe = { baseitem.parenttool },
      replacements = { { baseitem.parenttool, "default:stick 2" } }
    })
end

local function create_custom_tools()
  for _, i in ipairs(custom) do
      minetest.register_craftitem(i.name, {
        description = i.desc,
        inventory_image = i.img
      })
      
      minetest.register_craft(i.craft)
      
      if i.tempertime ~= nil and i.tempertime > 0 then
        minetest.register_craftitem(i.name..TEMPERED_SUFFIX, {
          description = TEMPERED_PREFIX_DESC..i.desc,
          inventory_image = "mtz_tempered_bg.png^"..i.img
        })
        minetest.register_craft({
          type = "cooking",
          output = i.name..TEMPERED_SUFFIX,
          recipe = i.name,
          cooktime = i.tempertime
        })
      end
      
      if i.tooldef then
        minetest.register_tool(i.tooldef.name, i.tooldef.specs)
        minetest.register_craft({ output = i.tooldef.name, 
                                  recipe = i.tooldef.recipe })
      end
  end
end

create_custom_tools()

for _, curritem in ipairs(dismantle_items) do
  create_toolhead_from_base(curritem)
end
	
for _, tool in ipairs(tooldefs) do
  minetest.register_tool(tool.name, tool.specs)
  minetest.register_craft({
    output = tool.name,
    recipe = tool.recipe
  })
end

