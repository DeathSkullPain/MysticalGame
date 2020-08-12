local reg = minetest.register_node
local mod = 'mystical_lands:'

-- metal ores

reg(
  mod .. 'ore_iron_poor',
  {
    description = 'Poor iron ore',
    tiles = {'mystical_lands_ore_iron_poor.png'},
    diggable = true,
      --sounds = default.node_sound_stone_defaults(),
      groups = {cracky = 3, stone = 1},
    }
  )
  
reg(
  mod .. 'ore_iron',
  {
    description = 'Iron ore',
    tiles = {'mystical_lands_ore_iron.png'},
    diggable = true,
      --sounds = default.node_sound_stone_defaults(),
      groups = {cracky = 3, stone = 1},
    }
  )

reg(
  mod .. 'ore_iron_rich',
  {
    description = 'Rich iron ore',
    tiles = {'mystical_lands_ore_iron_rich.png'},
    diggable = true,
      --sounds = default.node_sound_stone_defaults(),
      groups = {cracky = 3, stone = 1},
    }
  )
  