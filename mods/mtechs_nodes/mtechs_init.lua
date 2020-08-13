local mtechs = mtechs
local m = mtechs_nodes

m.actions = {
  a_mtechs_nodes_check_supported = 'a_mtechs_nodes_check_supported',
    -- data.pos = {x = 0, y = 0, z = 0}
}

m.components = {
    c_mtechs_nodes_falling = 'c_mtechs_nodes_falling',
    c_mtechs_nodes_require_support_below = 'c_mtechs_nodes_require_support_below',
    c_mtechs_nodes_unsuported_falling = 'c_mtechs_nodes_unsuported_falling',
}

m.entity_templates = {
    et_mtechs_nodes_falling_node = { m.components.c_mtechs_nodes_falling },
}

m.systems = {
    s_mtechs_nodes_falling_node = {
        sid = 's_mtechs_nodes_falling_node',
        actions = { m.actions.a_mtechs_nodes_check_supported },
        components = { m.components.c_mtechs_nodes_falling },
        handle = function(self, action)
            if not action.data then return end
            if not action.data.pos then return end
              
            local eid = mtechs:get_node_eid_at_position(action.data.pos)
            if not eid then return end
            if not self.entities[eid] then return end
          end,
    },
}

for i,aid in ipairs(m.actions) do
    mtechs:register_action(aid)
end

for i,cid in ipairs(m.components) do
    mtechs:register_component(cid)
end

for i,s in ipairs(m.systems) do
    mtechs:register_system(s.sid, s.actions, s.components, s.handle)
end

--[[ 
  order of registration is
    1. actions
    2. components
    3. systems
    4. entities (after server startup)
]]--



function m.register_action(self, aid)
  local a = {}
  a.systems = {}
  self.actions[action.aid] = a
end

function m.register_component(self, cid)
  local c = {}
  c.entities = {}
  self.components[cid] = c
end

function m.register_system(self, sid, actions, components, handle)
  local s = {}
  
  s.actions = {}
  for action in pairs(actions) do
    s.actions[action] = true
    self.actions[action].systems[sid] = true
  end
  
  s.components = {}
  for component in pairs(components) do
    s.components[component] = true
  end
  
  s.entities = {}
  
  self.systems[sid] = s
end

function m.get_systems_for_components(self, components)
    local systems = {}
    
    for sid,system in pairs(self.systems) do
      local found_all = true
      
      for component in pairs(components) do
        if not system.components[component] then
          found_all = false
          break
        end
      end
      
      if found_all then
        systems[#systems + 1] = sid
      end
    end
    
    return systems
end


function m.add_entity(self, entity_name, components)
  local e
  e.eid = entity_name .. tostring(#self.entities + 1)
  e.components = {}
  e.systems = {}
  
  for cid in pairs(components) do
    self.components[cid].entities[e.eid] = true
    e.components[cid] = true
  end
  
  local systems = self.get_systems_for_components(self, e.components)
  for sid in pairs(systems) do
    self.systems[sid].entities[e.eid] = true
    e.systems[sid] = true
  end
  
  self.entities[eid] = e
  
  return e.eid
end

function m.remove_entity(self, eid)
  local e = self.entities[eid]
  
  for sid,system in pairs(e.systems) do
    self.systems[sid].entities[eid] = nil
  end
  
  for cid,component in pairs(e.components) do
    self.components[cid].entities[eid] = nil
  end
  
  self.entities[eid] = nil
end
