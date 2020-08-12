mtechs = {}

local m = mtechs

m.actions = {}
m.components = {}
m.entities = {}
m.systems = {}

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
  s.handle = handle
  
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
