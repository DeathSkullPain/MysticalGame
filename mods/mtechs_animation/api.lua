local m = mtechs_animation
local register_node = minetest.register_node
local register_entity = minetest.register_entity

function m.register_model_nodebox(
    description,
    tiles,
    nodebox
    )
    
    local data = {
      description = description,
      tiles = tiles,
      paramtype = 'light',
      drawtype = 'nodebox',
      node_box = {
          type = 'fixed',
          fixed = nodebox
        },
      groups = {not_in_creative_inventory = 1}
    }
    
    local name = m.append_mod_prefix(description)
    register_node(name, data)
    
    return name
end

function m.register_model_entity(name, nodebox, collisionbox, visual_size)
    if not collisionbox then
      local d = 0.1
      collisionbox = {-1*d, -1*d, -1*d, d, d, d}
    end
    
    if not visual_size then
      visual_size = {x = 1, y = 1}
    end
    
    local data = {
        initial_properties = {
          physical = true,
          collide_with_objects = false,
          collisionbox = collisionbox,
          visual = 'wielditem',
          textures = {nodebox},
        }
    }
    
    local full_name = m.append_mod_prefix(name)
    register_entity(full_name, data)
    
    return full_name
end

