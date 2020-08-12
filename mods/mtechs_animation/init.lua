mtechs_animation = {}

local m = mtechs_animation
m.mod_name = 'mtechs_animation'
m.mod_prefix = m.mod_name .. ':'
local path = minetest.get_modpath(minetest.get_current_modname()) .. '/'

function m.append_mod_name(s)
  return m.mod_name .. '_' .. s
end

function m.append_mod_prefix(s)
  return m.mod_prefix .. '_' .. s
end
