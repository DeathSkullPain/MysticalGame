minetest.register_on_joinplayer(function(player)
  local scale = 2
	player:set_properties({
    visual_size = {x = scale, y = scale},
		collisionbox = {
      -0.3 * scale, 
      0.0 * scale, 
      -0.3 * scale, 
      0.3 * scale, 
      1.7 * scale, 
      0.3 * scale
    },
    stepheight = 0.6 * scale,
    eye_height = 1.625 * scale
  })

  local physics = player:get_physics_override()
  physics.jump = 1.7
  physics.speed = 2.5
  player:set_physics_override(physics)
end)
