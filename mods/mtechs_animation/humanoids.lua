local m = mtechs_animation
local add_entity = minetest.add_entity


--[[
  Humanoid template
  {
    head_entity_id,
    head_offset = {x, y, z}, -- used torso to connect
    torso_entity_id,
    torso_arm_offset = {x, y, z}, -- used by arms to connect, x is negative for left
    torso_leg_offset = {x, y, z}, -- used by legs to connect, x is negative for left
    arm_right_entity_id,
    arm_left_entity_id,
    leg_right_entity_id,
    leg_left_entity_id
  }
]]--

function m.create_humanoid_model(
    template, position
  )
  
  local entities = {}
  local rotation = {x = 0, y = 0, z = 0}
  local bone = ''
  local offset
  
  local head = add_entity(position, template.head_entity_id)
  
  local torso = add_entity(position, template.torso_entity_id)
  torso:set_attach(head, bone, template.head_offset, rotation)
  
  local arm_right = add_entity(position, template.arm_right_entity_id)
  offset = template.torso_arm_offset
  arm_right:set_attach(torso, bone, offset, rotation)
  
  local arm_left = add_entity(position, template.arm_left_entity_id)
  offset.x = -1 * offset.x
  arm_left:set_attach(torso, bone, offset, rotation)
  
  local leg_right = add_entity(position, template.leg_right_entity_id)
  offset = template.torso_leg_offset
  leg_right:set_attach(torso, bone, offset, rotation)
  
  local leg_left = add_entity(position, template.leg_left_entity_id)
  offset.x = -1 * offset.x
  leg_left:set_attach(torso, bone, offset, rotation)
  
  entities = {head, torso, arm_right, arm_left, leg_left, leg_right)
  
  local 
    
end