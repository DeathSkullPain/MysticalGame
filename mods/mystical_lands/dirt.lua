local reg = minetest.register_node
local mod = 'mystical_lands:'

-- earth nodes

local dirt_nodes = {
  -- soils
  
  { description = 'Dark clay soil', name = 'dark_clay_soil', tile = 'mystical_lands_dark_clay_soil.png' },
  { description = 'Dark loam soil', name = 'dark_loam_soil', tile = 'mystical_lands_dark_loam_soil.png' },
  { description = 'Dark sandy soil', name = 'dark_sandy_soil', tile = 'mystical_lands_dark_sandy_soil.png' },
  { description = 'Dark silt soil', name = 'dark_silt_soil', tile = 'mystical_lands_dark_silt_soil.png' },
  
  { description = 'Clay soil', name = 'clay_soil', tile = 'mystical_lands_clay_soil.png' },
  { description = 'Loam soil', name = 'loam_soil', tile = 'mystical_lands_loam_soil.png' },
  { description = 'Sandy soil', name = 'sandy_soil', tile = 'mystical_lands_sandy_soil.png' },
  { description = 'Silt soil', name = 'silt_soil', tile = 'mystical_lands_silt_soil.png' },
  
  { description = 'Light clay soil', name = 'light_clay_soil', tile = 'mystical_lands_light_clay_soil.png' },
  { description = 'Light loam soil', name = 'light_loam_soil', tile = 'mystical_lands_light_loam_soil.png' },
  { description = 'Light sandy soil', name = 'light_sandy_soil', tile = 'mystical_lands_light_sandy_soil.png' },
  { description = 'Light silt soil', name = 'light_silt_soil', tile = 'mystical_lands_light_silt_soil.png' },
  
  { description = 'Dark lush grass', name = 'dark_lush_grass', tile = 'mystical_lands_dark_lush_grass.png' },
  { description = 'Lush grass', name = 'lush_grass', tile = 'mystical_lands_lush_grass.png' },
  { description = 'Light lush grass', name = 'light_lush_grass', tile = 'mystical_lands_light_lush_grass.png' },
  
  { description = 'Dark grass', name = 'dark_grass', tile = 'mystical_lands_dark_grass.png' },
  { description = 'Grass', name = 'grass', tile = 'mystical_lands_grass.png' },
  { description = 'Light grass', name = 'light_grass', tile = 'mystical_lands_light_grass.png' },
  
  { description = 'Patchy dark grass', name = 'dark_patchy_grass', tile = 'mystical_lands_dark_patchy_grass.png' },
  { description = 'Patchy grass', name = 'patchy_grass', tile = 'mystical_lands_patchy_grass.png' },
  { description = 'Patchy light grass', name = 'light_patchy_grass', tile = 'mystical_lands_light_patchy_grass.png' },
}

for index, n in pairs(dirt_nodes) do
  reg(
      mod .. n.name,
      {
        description = n.description,
        tiles = {n.tile},
        walkable = true,
        pointable = true,
        diggable = true,
        --sounds = default.node_sound_stone_defaults(),
        groups = {cracky = 3, stone = 1, mystical_lands_falling = 1},
      }
    )
  end