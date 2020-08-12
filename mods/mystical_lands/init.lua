mystical_lands = {}

local ml = mystical_lands
ml.mod_name = 'mystical_lands'
ml.mod_prefix = ml.mod_name .. ':'

function ml.append_mod_name(s)
  return ml.mod_name .. '_' .. s
end

function ml.append_mod_prefix(s)
  return ml.mod_prefix .. '_' .. s
end

local path = minetest.get_modpath(minetest.get_current_modname()) .. '/'

local inits = {
  'stone',
  'ores',
  'dirt',
  'plants',
  'mapgen'
}

for index, init in pairs(inits) do
  dofile(path .. init .. '.lua')
end 


  --[[
  reg(
  mod .. 'wardstone_purple',
  {
    description = 'Purple wardstone',
    tiles = {'mystical_lands_wardstone_purple.png'},
    use_texture_alpha = true,
    light_source = 6,
    drawtype = 'glasslike',
    paramtype = "light",
    sunlight_propagates = true,
    is_ground_content = false,
    diggable = true,
      --sounds = default.node_sound_stone_defaults(),
    groups = {cracky = 3},
    }
  )
        ]]--