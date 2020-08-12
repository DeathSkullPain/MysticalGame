mtechs_nodes = {}

local m = mtechs_nodes
m.mod_name = 'mtechs_nodes'
m.mod_prefix = m.mod_name .. ':'
local path = minetest.get_modpath(minetest.get_current_modname()) .. '/'

dofile(path .. "mtechs_init.lua")
