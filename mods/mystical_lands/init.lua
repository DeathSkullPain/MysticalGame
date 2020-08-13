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
