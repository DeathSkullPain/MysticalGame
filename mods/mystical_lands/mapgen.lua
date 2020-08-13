--
-- Aliases for map generators

--[[

minetest.register_alias("mapgen_stone", "mystical_lands:soft_fine_grain_light_gray_stone")
minetest.register_alias("mapgen_dirt", "mystical_lands:hard_fine_grain_light_olive_stone")
minetest.register_alias("mapgen_dirt_with_grass", "mystical_lands:hard_fine_grain_light_olive_stone")
minetest.register_alias("mapgen_sand", "mystical_lands:hard_fine_grain_light_olive_stone")
minetest.register_alias("mapgen_water_source", "mystical_lands:hard_fine_grain_light_olive_stone")
minetest.register_alias("mapgen_river_water_source", "mystical_lands:hard_fine_grain_light_olive_stone")
minetest.register_alias("mapgen_lava_source", "mystical_lands:hard_fine_grain_light_olive_stone")
minetest.register_alias("mapgen_gravel", "mystical_lands:hard_fine_grain_light_olive_stone")
minetest.register_alias("mapgen_desert_stone", "mystical_lands:hard_fine_grain_light_olive_stone")
minetest.register_alias("mapgen_desert_sand", "mystical_lands:hard_fine_grain_light_olive_stone")
minetest.register_alias("mapgen_dirt_with_snow", "mystical_lands:hard_fine_grain_light_olive_stone")
minetest.register_alias("mapgen_snowblock", "mystical_lands:hard_fine_grain_light_olive_stone")
minetest.register_alias("mapgen_snow", "mystical_lands:hard_fine_grain_light_olive_stone")
minetest.register_alias("mapgen_ice", "mystical_lands:hard_fine_grain_light_olive_stone")
minetest.register_alias("mapgen_sandstone", "mystical_lands:hard_fine_grain_light_olive_stone")

-- Flora

minetest.register_alias("mapgen_tree", "default:tree")
minetest.register_alias("mapgen_leaves", "default:leaves")
minetest.register_alias("mapgen_apple", "default:apple")
minetest.register_alias("mapgen_jungletree", "default:jungletree")
minetest.register_alias("mapgen_jungleleaves", "default:jungleleaves")
minetest.register_alias("mapgen_junglegrass", "default:junglegrass")
minetest.register_alias("mapgen_pine_tree", "default:pine_tree")
minetest.register_alias("mapgen_pine_needles", "default:pine_needles")

-- Dungeons

minetest.register_alias("mapgen_cobble", "default:cobble")
minetest.register_alias("mapgen_stair_cobble", "stairs:stair_cobble")
minetest.register_alias("mapgen_mossycobble", "default:mossycobble")
minetest.register_alias("mapgen_stair_desert_stone", "stairs:stair_desert_stone")
minetest.register_alias("mapgen_sandstonebrick", "default:sandstonebrick")
minetest.register_alias("mapgen_stair_sandstone_block", "stairs:stair_sandstone_block")



-- Register ores
--

-- Mgv6
function mystical_lands.register_mgv6_ores()
end

function mystical_lands.register_ores()
end

-- Register biomes
--
]]--
-- All mapgens except mgv6

--[[
  Register verticle slices of biomes with harder and harder stone
  as it goes down.  Also register the 'ores' which add some stone 
  within stone so that things are not a large uniform blob.
  ]]--
  
local mod = mystical_lands
local mod_name_str = 'mystical_lands:'

function mod.stone_name(hardness, grain, color)
    return mod_name_str .. hardness .. '_' .. grain .. '_' .. color .. '_stone'
end

function mod.node_name(name)
    return mod_name_str .. name
end

function mod.ore_name(name)
    return mod_name_str .. 'ore_' .. name
end



function mod.register_stone_ores(biome_name, y_max, y_min,
    stone, blob_stones, sheet_stones, puff_stones, scatter_stones)
  local blob_np = {
            offset = 0,
            scale = 1,
            spread = {x = 100, y = 100, z = 100},
            seed = 23,
            octaves = 3,
            persist = 0.7
        }
  local sheet_np = {
            offset = 0,
            scale = 1,
            spread = {x = 70, y = 70, z = 70},
            seed = 30,
            octaves = 3,
            persist = 0.7
        }
  local puff_np = {
            offset = 0,
            scale = 1,
            spread = {x = 50, y = 50, z = 50},
            seed = 40,
            octaves = 3,
            persist = 0.7
        }
  local puff_top_np = {
            offset = 4,
            scale = 2,
            spread = {x = 50, y = 50, z = 50},
            seed = 47,
            octaves = 3,
            persist = 0.7
        }
  local puff_bot_np = {
            offset = 4,
            scale = 2,
            spread = {x = 50, y = 50, z = 50},
            seed = 11,
            octaves = 3,
            persist = 0.7
        }
        
  local scarcity = 32 * 32 * 32
  local ore_in = {}
  local r = minetest.register_ore
    -- blob stones
  ore_in = {stone}
  for i, ore in ipairs(blob_stones) do
    r({
        ore_type = 'blob',
        ore = ore,
        wherein = ore_in,
        clust_scarcity = scarcity,
        clust_size = 24,
        y_max = y_max,
        y_min = y_min,
        noise_params = blob_np,
        biomes = {biome_name}
      })
  end
  
  -- sheet stones
  for i, ore in ipairs(blob_stones) do
    ore_in[#ore_in + 1] = ore
  end
  for i, ore in ipairs(sheet_stones) do
    r({
        ore_type = 'sheet',
        ore = ore,
        wherein = ore_in,
        clust_scarcity = scarcity,
        clust_size = 16,
        y_max = y_max,
        y_min = y_min,
        noise_params = sheet_np,
        column_height_min = 1,
        column_height_max = 16,
        column_midpoint_factor = 0.5,
        biomes = {biome_name}
      })
  end
  
  -- puff stones
  for i, ore in ipairs(sheet_stones) do
    ore_in[#ore_in + 1] = ore
  end
  for i, ore in ipairs(puff_stones) do
    r({
        ore_type = 'puff',
        ore = ore,
        wherein = ore_in,
        clust_scarcity = scarcity,
        clust_size = 8,
        y_max = y_max,
        y_min = y_min,
        noise_params = puff_np,
        np_puff_top = puff_top_np,
        np_puff_bottom = puff_bot_np,
        biomes = {biome_name}
      })
  end
  
  -- scatter stones
  for i, ore in ipairs(puff_stones) do
    ore_in[#ore_in + 1] = ore
  end
  -- make some noise
  for i, stone in ipairs(ore_in) do
    scatter_stones[#scatter_stones + 1] = stone
  end
  for i, ore in ipairs(scatter_stones) do
    r({
        ore_type = 'scatter',
        ore = ore,
        wherein = ore_in,
        clust_scarcity = 8 * 8 * 8,
        clust_num_ores = 8,
        clust_size = 16,
        y_max = y_max,
        y_min = y_min,
        biomes = {biome_name}
      })
  end
end


function mod.register_iron_ore(biome_name, y_max, y_min,
    segments, direction, ore, scarcity_multiple, cluster_size, wherein_stones)
        
  local scarcity = scarcity_multiple * scarcity_multiple * scarcity_multiple
  local ore_in = wherein_stones
  local r = minetest.register_ore
  
  -- scatter stones
  for i, ore in ipairs(puff_stones) do
    ore_in[#ore_in + 1] = ore
  end
  -- make some noise
  for i, stone in ipairs(ore_in) do
    scatter_stones[#scatter_stones + 1] = stone
  end
  for i, ore in ipairs(scatter_stones) do
    r({
        ore_type = 'scatter',
        ore = ore,
        wherein = ore_in,
        clust_scarcity = scarcity,
        clust_num_ores = 8,
        clust_size = 3,
        y_max = y_max,
        y_min = y_min,
        biomes = {biome_name}
      })
  end
end


function mod.register_biome(biome_name, stone_color, grass, soil, deco, heat, humidity, mountain_height, foothill_height, 
    dirt_height, shore_height, soft_height, hard_height, vhard_height)
  local node_dust = "default:snow"
  local top_depth = 1
  local node_filler = "default:permafrost"
  local dirt_depth = 4
  local node_stone = "default:bluestone"
  local node_water_top = "default:ice"
  local depth_water_top = 10
  local node_water = ""
  local node_river_water = "default:ice"
  local node_riverbed = "default:gravel"
  local depth_riverbed = 4
  local node_cave_liquid = "default:water_source"
  local node_dungeon = "default:cobble"
  local node_dungeon_alt = "default:mossycobble"
  local node_dungeon_stair = "stairs:stair_cobble"
  local blend = 8
  
  local name = ''
  local y_min = 0
  local y_max = 0
  local stone = ''
  local blob_stones = {}
  local sheet_stones = {}
  local puff_stones = {}
  local scatter_stones = {}
  local ore_in = {}
  
  local register_biome = minetest.register_biome
  local register_decoration = minetest.register_decoration
  local sn = mod.stone_name
  local soilname = mod.node_name
  local hard = 'hard'
  local vhard = 'very_hard'
  local soft = 'soft'
  local vsoft = 'very_soft'
  local coarse = 'coarse_grain'
  local fine = 'fine_grain'
  local smooth = 'smooth'
  local glassy = 'glassy'
  local mountian = 'mountian'
  local hills = 'hills'
  local dirt = 'dirt'
  
  
  
  -- Hill and dirt layer grass
  if deco then
    if deco.small_bushes then
      local decorations = {}
      for i,decoration in ipairs(deco.small_bushes.nodes) do
        decorations[#decorations + 1] = soilname(decoration)
      end
      
      register_decoration({
          deco_type = 'simple',
          place_on = soilname(grass),
          sidelen = 1,
          fill_ratio = deco.small_bushes.fill,
          decoration = decorations,
          height = 1,
          paramtype2 = 'meshoptions',
          param2 = 4,
          biomes = {biome_name .. '_' .. hills, biome_name .. '_' .. dirt}
          })
    end
    if deco.grass then
      local decorations = {}
      for i,decoration in ipairs(deco.grass.nodes) do
        decorations[#decorations + 1] = soilname(decoration)
      end
      
      register_decoration({
          deco_type = 'simple',
          place_on = soilname(grass),
          sidelen = 1,
          fill_ratio = deco.grass.fill,
          decoration = decorations,
          height = 1,
          biomes = {biome_name .. '_' .. hills, biome_name .. '_' .. dirt}
          })
    end
    if deco.trees then
      local decorations = {}
      for i,decoration in ipairs(deco.trees) do
        
        register_decoration({
            name = mod.node_name(decoration.name),
            deco_type = 'schematic',
            place_on = soilname(grass),
            sidelen = decoration.sidelen,
            noise_params = {
              offset = 0,
              scale = 0.002,
              spread = {x = decoration.spread, y = decoration.spread, z = decoration.spread},
              seed = 2,
              octaves = 3,
              persist = 0.66
            },
            biomes = {biome_name .. '_' .. hills, biome_name .. '_' .. dirt},
            schematic = decoration.schematic,
            flags = "place_center_x, place_center_z",
            rotation = "random",
            place_offset_y = -2,
          }
        )
      end
      
      
    end
  end
  
  
  -- mountain layer, hard
  name = biome_name .. '_' .. mountian
  y_max = mountain_height.top
  y_min = mountain_height.bot
  stone = sn(hard, coarse, stone_color)
  blob_stones = {sn(hard, fine, stone_color), sn(hard, smooth, stone_color)}
  sheet_stones = {sn(vhard, fine, stone_color), sn(hard, glassy, stone_color)}
  puff_stones = {sn(vsoft, coarse, stone_color), sn(vsoft, fine, stone_color)}
  scatter_stones = {sn(vhard, smooth, stone_color)}
  register_biome({
    name = name,
    --node_dust = '',
    --node_top = node_top,
    --depth_top = depth_top,
    --node_filler = node_filler,
    --depth_filler = depth_filler,
    node_stone = stone,
    --node_water_top = node_water_top,
    --depth_water_top = depth_water_top,
    --node_water = node_water,
    --node_river_water = node_river_water,
    --node_riverbed = node_riverbed,
    --depth_riverbed = depth_riverbed,
    --node_cave_liquid = node_cave_liquid,
    --node_dungeon = node_dungeon,
    --node_dungeon_alt = node_dungeon_alt,
    --node_dungeon_stair = node_dungeon_stair,
    y_max = y_max,
    y_min = y_min,
    vertical_blend = blend,
    heat_point = heat,
    humidity_point = humidity
	})
  mod.register_stone_ores(name, y_max, y_min,
    stone, blob_stones, sheet_stones, puff_stones, scatter_stones)
  
  -- Foothills layer, soft
  name = biome_name .. '_' .. hills
  y_max = foothill_height.top
  y_min = foothill_height.bot
  stone = sn(soft, coarse, stone_color)
  blob_stones = {sn(soft, fine, stone_color), sn(soft, smooth, stone_color)}
  sheet_stones = {sn(hard, fine, stone_color), sn(soft, glassy, stone_color)}
  puff_stones = {sn(vhard, coarse, stone_color), sn(vhard, fine, stone_color)}
  scatter_stones = {sn(vhard, smooth, stone_color)}
  register_biome({
    name = name,
    --node_dust = '',
    node_top = soilname(grass),
    depth_top = top_depth,
    node_filler = soilname(soil),
    depth_filler = dirt_depth,
    node_stone = stone,
    --node_water_top = node_water_top,
    --depth_water_top = depth_water_top,
    --node_water = node_water,
    --node_river_water = node_river_water,
    --node_riverbed = node_riverbed,
    --depth_riverbed = depth_riverbed,
    --node_cave_liquid = node_cave_liquid,
    --node_dungeon = node_dungeon,
    --node_dungeon_alt = node_dungeon_alt,
    --node_dungeon_stair = node_dungeon_stair,
    y_max = y_max,
    y_min = y_min,
    vertical_blend = blend,
    heat_point = heat,
    humidity_point = humidity
	})
  mod.register_stone_ores(name, y_max, y_min,
    stone, blob_stones, sheet_stones, puff_stones, scatter_stones)
  
  -- Top very soft layer, dirt
  name = biome_name .. '_' .. dirt
  y_max = dirt_height.top
  y_min = dirt_height.bot
  stone = sn(vsoft, coarse, stone_color)
  blob_stones = {sn(vsoft, fine, stone_color), sn(vsoft, smooth, stone_color)}
  sheet_stones = {sn(soft, fine, stone_color), sn(vsoft, glassy, stone_color)}
  puff_stones = {sn(hard, coarse, stone_color), sn(hard, fine, stone_color)}
  scatter_stones = {sn(hard, smooth, stone_color)}
  
  register_biome({
    name = name,
    --node_dust = '',
    node_top = soilname(grass),
    depth_top = top_depth,
    node_filler = soilname(soil),
    depth_filler = dirt_depth,
    node_stone = stone,
    --node_water_top = node_water_top,
    --depth_water_top = depth_water_top,
    --node_water = node_water,
    --node_river_water = node_river_water,
    --node_riverbed = node_riverbed,
    --depth_riverbed = depth_riverbed,
    --node_cave_liquid = node_cave_liquid,
    --node_dungeon = node_dungeon,
    --node_dungeon_alt = node_dungeon_alt,
    --node_dungeon_stair = node_dungeon_stair,
    y_max = y_max,
    y_min = y_min,
    vertical_blend = blend,
    heat_point = heat,
    humidity_point = humidity
	})

  mod.register_stone_ores(name, y_max, y_min,
    stone, blob_stones, sheet_stones, puff_stones, scatter_stones)
  
  
  
  
  -- Shore layer
  y_max = shore_height.top
  y_min = shore_height.bot
  

  -- Soft layer
  name = biome_name .. '_' .. soft
  y_max = soft_height.top
  y_min = soft_height.bot
  stone = sn(soft, coarse, stone_color)
  blob_stones = {sn(soft, fine, stone_color), sn(soft, smooth, stone_color)}
  sheet_stones = {sn(hard, fine, stone_color), sn(soft, glassy, stone_color)}
  puff_stones = {sn(vhard, coarse, stone_color), sn(vhard, fine, stone_color)}
  scatter_stones = {sn(vhard, smooth, stone_color)}
  register_biome({
    name = name,
    --node_dust = '',
    --node_top = node_top,
    --depth_top = depth_top,
    --node_filler = node_filler,
    --depth_filler = depth_filler,
    node_stone = stone,
    --node_water_top = node_water_top,
    --depth_water_top = depth_water_top,
    --node_water = node_water,
    --node_river_water = node_river_water,
    --node_riverbed = node_riverbed,
    --depth_riverbed = depth_riverbed,
    --node_cave_liquid = node_cave_liquid,
    --node_dungeon = node_dungeon,
    --node_dungeon_alt = node_dungeon_alt,
    --node_dungeon_stair = node_dungeon_stair,
    y_max = y_max,
    y_min = y_min,
    vertical_blend = blend,
    heat_point = heat,
    humidity_point = humidity
	})
  mod.register_stone_ores(name, y_max, y_min,
    stone, blob_stones, sheet_stones, puff_stones, scatter_stones)
  
  -- Ocean layer, soft
  
  -- Hard layer
  name = biome_name .. '_' .. hard
  y_max = hard_height.top
  y_min = hard_height.bot
  stone = sn(hard, coarse, stone_color)
  blob_stones = {sn(hard, fine, stone_color), sn(hard, smooth, stone_color)}
  sheet_stones = {sn(vhard, fine, stone_color), sn(hard, glassy, stone_color)}
  puff_stones = {sn(vsoft, coarse, stone_color), sn(vsoft, fine, stone_color)}
  scatter_stones = {sn(vhard, smooth, stone_color)}
  register_biome({
    name = name,
    --node_dust = '',
    --node_top = node_top,
    --depth_top = depth_top,
    --node_filler = node_filler,
    --depth_filler = depth_filler,
    node_stone = stone,
    --node_water_top = node_water_top,
    --depth_water_top = depth_water_top,
    --node_water = node_water,
    --node_river_water = node_river_water,
    --node_riverbed = node_riverbed,
    --depth_riverbed = depth_riverbed,
    --node_cave_liquid = node_cave_liquid,
    --node_dungeon = node_dungeon,
    --node_dungeon_alt = node_dungeon_alt,
    --node_dungeon_stair = node_dungeon_stair,
    y_max = y_max,
    y_min = y_min,
    vertical_blend = blend,
    heat_point = heat,
    humidity_point = humidity
	})
  mod.register_stone_ores(name, y_max, y_min,
    stone, blob_stones, sheet_stones, puff_stones, scatter_stones)
  
  -- Deep ocean layer, hard
  
  -- Very hard layer
  name = biome_name .. '_' .. vhard
  y_max = vhard_height.top
  y_min = vhard_height.bot
  stone = sn(vhard, coarse, stone_color)
  blob_stones = {sn(vhard, fine, stone_color), sn(vhard, smooth, stone_color)}
  sheet_stones = {sn(vhard, fine, stone_color), sn(vhard, glassy, stone_color)}
  puff_stones = {sn(soft, coarse, stone_color), sn(soft, fine, stone_color)}
  scatter_stones = {sn(hard, smooth, stone_color)}
  register_biome({
    name = name,
    --node_dust = '',
    --node_top = node_top,
    --depth_top = depth_top,
    --node_filler = node_filler,
    --depth_filler = depth_filler,
    node_stone = stone,
    --node_water_top = node_water_top,
    --depth_water_top = depth_water_top,
    --node_water = node_water,
    --node_river_water = node_river_water,
    --node_riverbed = node_riverbed,
    --depth_riverbed = depth_riverbed,
    --node_cave_liquid = node_cave_liquid,
    --node_dungeon = node_dungeon,
    --node_dungeon_alt = node_dungeon_alt,
    --node_dungeon_stair = node_dungeon_stair,
    y_max = y_max,
    y_min = y_min,
    vertical_blend = blend,
    heat_point = heat,
    humidity_point = humidity
	})
  mod.register_stone_ores(name, y_max, y_min,
    stone, blob_stones, sheet_stones, puff_stones, scatter_stones)
end



function mod.register_biomes(mod_name, upper_limit, lower_limit)
    --[[
  
  World layers
  max - upper_limit
    max:400   - mountains
    399:50    - foothills
     49:-100  - dirt
     10:-10   - shore
   -101:-500  - soft
   -501:-1500 - hard
  -1501:min very hard
  min - lower_limit
  ]]--
  
  local mountain_height = {top = upper_limit, bot = 120}
  local foothill_height = {top = 119, bot = 21}
  local dirt_height = {top = 20, bot = -100}
  local shore_height = {top = 10, bot = -10}
  local soft_height = {top = -101, bot = -500}
  local hard_height = {top = -501, bot = -1500}
  local vhard_height = {top = -1501, bot = lower_limit}
  local register_biome = mod.register_biome
  
  local lush_grass_fill = 0.4
  local grass_fill = 0.3
  local patchy_grass_fill = 0.04
  local dark_grass_nodes = {'dark_grass_small', 'dark_grass_medium', 'dark_grass_large'}
  local grass_nodes = {'grass_small', 'grass_medium', 'grass_large'}
  local light_grass_nodes = {'light_grass_small', 'light_grass_medium', 'light_grass_large'}
  
  local lush_bush_fill = 0.1
  local bush_fill = 0.08
  local patchy_bush_fill = 0.02
  local dark_bush_nodes = {'dark_bush_grass'}
  local bush_nodes = {'bush_grass'}
  local light_bush_nodes = {'light_bush_grass'}
  
  local tree_dark_green_medium = mod.plants.make_schematic_tree_dark_green_medium()
  
  local biomes = {
    {name = 'arctic_desert',  
      color = 'white',
      grass = 'light_silt_soil',
      soil = 'light_silt_soil',
      deco = {
      },
      ores = {
      },
      heat =  0, humidity =  0},
    {name = 'badlands',
      color = 'dark_gray',
      grass = 'light_grass', 
      soil = 'dark_sandy_soil',
      deco = {
        grass = {fill = grass_fill, nodes = light_grass_nodes},
        small_bushes = {fill = bush_fill, nodes = light_bush_nodes},
        },
      heat = 23, humidity =  0},
    {name = 'arid_desert',
      color = 'light_olive',
      grass = 'light_patchy_grass', 
      soil = 'light_sandy_soil',
      deco = {
        grass = {fill = patchy_grass_fill, nodes = light_grass_nodes},
        small_bushes = {fill = patchy_bush_fill, nodes = light_bush_nodes},
        },
      heat = 43, humidity =  0},
    {name = 'desert',
      color = 'tan',
      grass = 'sandy_soil', 
      soil = 'sandy_soil',
      deco = {
        },
      heat = 69, humidity =  0},
    {name = 'death_desert',
      color = 'black',
      grass = 'dark_sandy_soil', 
      soil = 'dark_sandy_soil',
      deco = {
        },
      heat = 92, humidity =  0},
    {name = 'tundra',
      color = 'light_olive',
      grass = 'dark_patchy_grass', 
      soil = 'sandy_soil',
      deco = {
        grass = {fill = patchy_grass_fill, nodes = dark_grass_nodes},
        small_bushes = {fill = patchy_bush_fill, nodes = dark_bush_nodes},
        },
      heat =  0, humidity = 19},
    {name = 'arctic_grasslands',
      color = 'tan',
      grass = 'light_grass', 
      soil = 'light_silt_soil',
      deco = {
        grass = {fill = grass_fill, nodes = light_grass_nodes},
        small_bushes = {fill = bush_fill, nodes = light_bush_nodes},
        },
      heat = 23, humidity = 19},
    {name = 'grasslands',
      color = 'pink',
      grass = 'light_lush_grass', 
      soil = 'loam_soil',
      deco = {
        grass = {fill = lush_grass_fill, nodes = light_grass_nodes},
        small_bushes = {fill = lush_bush_fill, nodes = light_bush_nodes},
        },
      heat = 43, humidity = 19},
    {name = 'desert_forest',
      color = 'tan',
      grass = 'patchy_grass', 
      soil = 'dark_silt_soil',
      deco = {
        grass = {fill = patchy_grass_fill, nodes = grass_nodes},
        small_bushes = {fill = patchy_bush_fill, nodes = bush_nodes},
        },
      heat = 69, humidity = 19},
    {name = 'savannah',
      color = 'red',
      grass = 'dark_patchy_grass', 
      soil = 'dark_sandy_soil',
      deco = {
        grass = {fill = patchy_grass_fill, nodes = dark_grass_nodes},
        small_bushes = {fill = patchy_bush_fill, nodes = dark_bush_nodes},
        },
      heat = 92, humidity = 19},
    {name = 'taiga',
      color = 'light_olive',
      grass = 'patchy_grass', 
      soil = 'dark_silt_soil',
      deco = {
        grass = {fill = patchy_grass_fill, nodes = grass_nodes},
        small_bushes = {fill = patchy_bush_fill, nodes = bush_nodes},
        },
      heat =  0, humidity = 38},
    {name = 'arctic_brushlands',
      color = 'dark_gray',
      grass = 'light_patchy_grass', 
      soil = 'light_sandy_soil', 
      deco = {
        grass = {fill = patchy_grass_fill, nodes = light_grass_nodes},
        small_bushes = {fill = patchy_bush_fill, nodes = light_bush_nodes},
        },
      heat = 23, humidity = 38},
    {name = 'temerate',
      color = 'light_gray',
      grass = 'grass', 
      soil = 'loam_soil',
      deco = {
        grass = {fill = grass_fill, nodes = grass_nodes},
        small_bushes = {fill = bush_fill, nodes = bush_nodes},
        },
      heat = 43, humidity = 38},
    {name = 'unknown1',
      color = 'light_gray',
      grass = 'grass', 
      soil = 'clay_soil',
      deco = {
        grass = {fill = grass_fill, nodes = grass_nodes},
        small_bushes = {fill = bush_fill, nodes = bush_nodes},
        },
      heat = 69, humidity = 38},
    {name = 'unknown3',
      color = 'pink',
      grass = 'patchy_grass', 
      soil = 'silt_soil',
      deco = {
        grass = {fill = patchy_grass_fill, nodes = grass_nodes},
        small_bushes = {fill = patchy_bush_fill, nodes = bush_nodes},
        },
      heat = 92, humidity = 38},
    {name = 'snow_fields',
      color = 'gray_blue',
      grass = 'silt_soil', 
      soil = 'silt_soil',
      heat =  0, humidity = 58},
    {name = 'pine_forest',
      color = 'dark_gray',
      grass = 'light_patchy_grass', 
      soil = 'loam_soil',
      deco = {
        grass = {fill = patchy_grass_fill, nodes = light_grass_nodes},
        small_bushes = {fill = patchy_bush_fill, nodes = light_bush_nodes},
        },
      heat = 23, humidity = 58},
    {name = 'temperate_forest',
      color = 'light_gray',
      grass = 'lush_grass', 
      soil = 'light_loam_soil',
      deco = {
        grass = {fill = lush_grass_fill, nodes = grass_nodes},
        small_bushes = {fill = lush_bush_fill, nodes = bush_nodes},
        trees = { {name='tree_dark_green_medium', sidelen = 15, schematic = tree_dark_green_medium, spread = 500}, },
        },
      heat = 43, humidity = 58},
    {name = 'unknown2',
      color = 'turquoise',
      grass = 'dark_grass', 
      soil = 'clay_soil',
      deco = {
        grass = {fill = grass_fill, nodes = dark_grass_nodes},
        small_bushes = {fill = bush_fill, nodes = dark_bush_nodes},
        },
      heat = 69, humidity = 58},
    {name = 'jungle',
      color = 'dark_olive',
      grass = 'lush_grass', 
      soil = 'dark_loam_soil',
      deco = {
        grass = {fill = lush_grass_fill, nodes = grass_nodes},
        small_bushes = {fill = lush_bush_fill, nodes = bush_nodes},
        },
      heat = 92, humidity = 58},
    {name = 'glacier',
      color = 'dark_blue',
      grass = 'light_clay_soil', 
      soil = 'light_clay_soil',
      deco = {
        },
      heat =  0, humidity = 75},
    {name = 'giant_pine',
      color = 'dark_olive',
      grass = 'dark_patchy_grass', 
      soil = 'loam_soil',
      deco = {
        grass = {fill = patchy_grass_fill, nodes = dark_grass_nodes},
        small_bushes = {fill = patchy_bush_fill, nodes = dark_bush_nodes},
        },
      heat = 23, humidity = 75},
    {name = 'dense_forest',
      color = 'dark_gray',
      grass = 'dark_lush_grass', 
      soil = 'light_loam_soil',
      deco = {
        grass = {fill = lush_grass_fill, nodes = dark_grass_nodes},
        small_bushes = {fill = lush_bush_fill, nodes = dark_bush_nodes},
        },
      heat = 43, humidity = 75},
    {name = 'lush_forest',
      color = 'dark_olive',
      grass = 'lush_grass', 
      soil = 'dark_loam_soil',
      deco = {
        grass = {fill = lush_grass_fill, nodes = grass_nodes},
        small_bushes = {fill = lush_bush_fill, nodes = bush_nodes},
        },
      heat = 69, humidity = 75},
    {name = 'rainforest',
      color = 'dark_olive',
      grass = 'dark_lush_grass', 
      soil = 'dark_clay_soil',
      deco = {
        grass = {fill = lush_grass_fill, nodes = dark_grass_nodes},
        small_bushes = {fill = lush_bush_fill, nodes = dark_bush_nodes},
        },
      heat = 92, humidity = 75},
    }
  
  for i, biome in ipairs(biomes) do
    register_biome(biome.name, 
      biome.color, 
      biome.grass,
      biome.soil,
      biome.deco,
      biome.heat, 
      biome.humidity, 
      mountain_height, foothill_height, dirt_height, shore_height, soft_height, hard_height, vhard_height)
  end
end


function mystical_lands.register_wardstone_biomes(upper_limit, lower_limit)
  local register_biome = minetest.register_biome
  local node_name = mystical_lands.node_name
  
  local diff =  0 -- (lower_limit - upper_limit) / 2
  
  -- purple wardstones
  register_biome({
    name = 'purple_wardstone',
    node_stone = node_name('wardstone_purple'),
    y_max = upper_limit - diff,
    y_min = lower_limit,
    vertical_blend = 16,
	})
end


-- Biomes for floatlands

-- TODO Temporary simple biomes to be replaced by special floatland biomes later.


-- Mgv6

function mystical_lands.register_mgv6_decorations()
end



-- All mapgens except mgv6




function mystical_lands.register_decorations()

	-- Apple tree and log
end

	-- Grasses


--
-- Detect mapgen, flags and parameters to select functions
--


-- Get setting or default
local mgv7_spflags = minetest.get_mapgen_setting("mgv7_spflags") or
	"mountains, ridges, nofloatlands, caverns"
local captures_float = string.match(mgv7_spflags, "floatlands")
local captures_nofloat = string.match(mgv7_spflags, "nofloatlands")



minetest.clear_registered_biomes()
minetest.clear_registered_ores()
minetest.clear_registered_decorations()
minetest.clear_registered_schematics()

minetest.register_alias_force("mapgen_stone", "mystical_lands:soft_fine_grain_light_gray_stone")

local mg_name = minetest.get_mapgen_setting("mg_name")

local lower_limit = -3000
local ocean_max = -4
local shore_max = 4
local max = 100
local mountain_max = 200
local upper_limit = 1000

if mg_name == "v6" then
	--default.register_mgv6_ores()
	--default.register_mgv6_decorations()
-- Need to check for 'nofloatlands' because that contains
-- 'floatlands' which makes the second condition true.
elseif mg_name == "v7" and
		captures_float == "floatlands" and
		captures_nofloat ~= "nofloatlands" then
	-- Mgv7 with floatlands and floatland biomes
	--default.register_biomes(default.mgv7_shadow_limit - 1)
	--default.register_floatland_biomes(
		--default.mgv7_floatland_level, default.mgv7_shadow_limit)
	--default.register_ores()
	--default.register_decorations()
else
	mystical_lands.register_biomes('mystical_lands:', upper_limit, lower_limit)
  mystical_lands.register_wardstone_biomes(lower_limit - 1, lower_limit - 200)
	--default.register_ores()
	--default.register_decorations()
end