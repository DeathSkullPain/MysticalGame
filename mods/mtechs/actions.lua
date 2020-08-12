mtechs = {}

local m = mtechs


--[[ 
  order of registration is
    1. actions
    2. components
    3. systems
    4. entities (after server startup)
]]--

m.actions = {
  a_mt_entity_add = { 
    name = 'a_mt_entity_add' 
  },
  a_mt_item_add = { 
    name = 'a_mt_item_add' 
  },
  a_mt_node_level_ad = { 
    name = 'a_mt_node_level_ad' 
  },
  a_mt_particle_add = { 
    name = 'a_mt_particle_add' 
  },
  a_mt_particle_spawner_add = { 
    name = 'a_mt_particle_spawner_add' 
  },
  a_mt_areastore_insert_area = { 
    name = 'a_mt_areastore_insert_area' 
  },
  a_mt_areastore_remove = { 
    name = 'a_mt_areastore_remove' 
  },
  a_mt_areastore_reserve = { 
    name = 'a_mt_areastore_reserve' 
  },
  a_mt_areastore_set_cache_params = { 
    name = 'a_mt_areastore_set_cache_params' 
  },
  a_mt_areastore_to_file = { 
    name = 'a_mt_areastore_to_file' 
  },
  a_mt_player_ban = { 
    name = 'a_mt_player_ban' 
  },
  a_mt_node_bulkset = { 
    name = 'a_mt_node_bulkset' 
  },
  a_mt_chat_send_all = { 
    name = 'a_mt_chat_send_all' 
  },
  a_mt_chat_send_player = { 
    name = 'a_mt_chat_send_player' 
  },
  a_mt_objects_clear = { 
    name = 'a_mt_objects_clear' 
  },
  a_mt_formspec_close = { 
    name = 'a_mt_formspec_close' 
  },
  a_mt_inv_detached_create = { 
    name = 'a_mt_inv_detached_create' 
  },
  a_mt_schematic_create = { 
    name = 'a_mt_schematic_create' 
  },
  a_mt_area_delete = { 
    name = 'a_mt_area_delete' 
  },
  a_mt_particle_spawner_delete = { 
    name = 'a_mt_particle_spawner_delete' 
  },
  a_mt_node_dig = { 
    name = 'a_mt_node_dig' 
  },
  a_mt_item_eat = { 
    name = 'a_mt_item_eat' 
  },
  a_mt_area_emerge = { 
    name = 'a_mt_area_emerge' 
  },
  a_mt_area_fix_light = { 
    name = 'a_mt_area_fix_light' 
  },
  a_mt_forceload_block = { 
    name = 'a_mt_forceload_block' 
  },
  a_mt_forceload_free_block = { 
    name = 'a_mt_forceload_free_block' 
  },
  a_mt_generate_decorations = { 
    name = 'a_mt_generate_decorations' 
  },
  a_mt_hud_replace_builtin = { 
    name = 'a_mt_hud_replace_builtin' 
  },
  a_mt_inv_add_item = { 
    name = 'a_mt_inv_add_item' 
  },
  a_mt_inv_remove_item = { 
    name = 'a_mt_inv_remove_item' 
  },
  a_mt_inv_set_list = { 
    name = 'a_mt_inv_set_list' 
  },
  a_mt_inv_set_lists = { 
    name = 'a_mt_inv_set_lists' 
  },
  a_mt_inv_set_size = { 
    name = 'a_mt_inv_set_size' 
  },
  a_mt_inv_set_stack = { 
    name = 'a_mt_inv_set_stack' 
  },
  a_mt_inv_set_width = { 
    name = 'a_mt_inv_set_width' 
  },
  a_mt_item_drop = { 
    name = 'a_mt_item_drop' 
  },
  a_mt_item_eat = { 
    name = 'a_mt_item_eat' 
  },
  a_mt_item_place = { 
    name = 'a_mt_item_place' 
  },
  a_mt_item_place_node = { 
    name = 'a_mt_item_place_node' 
  },
  a_mt_item_place_object = { 
    name = 'a_mt_item_place_object' 
  },
  a_mt_kick_player = { 
    name = 'a_mt_kick_player' 
  },
  a_mt_load_area = { 
    name = 'a_mt_load_area' 
  },
  a_mt_meta_mark_as_private = { 
    name = 'a_mt_meta_mark_as_private' 
  },
  a_mt_meta_set_float = { 
    name = 'a_mt_meta_set_float' 
  },
  a_mt_meta_set_int = { 
    name = 'a_mt_meta_set_int' 
  },
  a_mt_meta_set_string = { 
    name = 'a_mt_meta_set_string' 
  },
  a_mt_modstore_mark_as_private = { 
    name = 'a_mt_modstore_mark_as_private' 
  },
  a_mt_modstore_set_float = { 
    name = 'a_mt_modstore_set_float' 
  },
  a_mt_modstore_set_int = { 
    name = 'a_mt_modstore_set_int' 
  },
  a_mt_modstore_set_string = { 
    name = 'a_mt_modstore_set_string' 
  },
  a_mt_node_dig = { 
    name = 'a_mt_node_dig' 
  },
  a_mt_node_punch = { 
    name = 'a_mt_node_punch' 
  },
  a_mt_obj_move_to = { 
    name = 'a_mt_obj_move_to' 
  },
  a_mt_obj_punch = { 
    name = 'a_mt_obj_punch' 
  },
  a_mt_obj_remove = { 
    name = 'a_mt_obj_remove' 
  },
  a_mt_obj_right_click = { 
    name = 'a_mt_obj_right_click' 
  },
  a_mt_obj_set_armor_groups = { 
    name = 'a_mt_obj_set_armor_groups' 
  },
  a_mt_obj_set_attach = { 
    name = 'a_mt_obj_set_attach' 
  },
  a_mt_obj_set_hp = { 
    name = 'a_mt_obj_set_hp' 
  },
  a_mt_obj_set_nametag = { 
    name = 'a_mt_obj_set_nametag' 
  },
  a_mt_obj_set_pos = {   
    name = 'a_mt_obj_set_pos' 
  },
  a_mt_obj_set_properties = { 
    name = 'a_mt_obj_set_properties' 
  },
  a_mt_obj_set_wieilded_item = { 
    name = 'a_mt_obj_set_wieilded_item' 
  },
  a_mt_place_node = { 
    name = 'a_mt_place_node' 
  },
  a_mt_place_schematic = { 
    name = 'a_mt_place_schematic' 
  },
  a_mt_place_schematic_on_vmanip = { 
    name = 'a_mt_place_schematic_on_vmanip' 
  },
  a_mt_player_hud_add = { 
    name = 'a_mt_player_hud_add' 
  },
  a_mt_player_hud_change = { 
    name = 'a_mt_player_hud_change' 
  },
  a_mt_player_hud_set_flags = { 
    name = 'a_mt_player_hud_set_flags' 
  },
  a_mt_player_hud_set_hotbar_image = { 
    name = 'a_mt_player_hud_set_hotbar_image' 
  },
  a_mt_player_hud_set_hotbar_itemcount = { 
    name = 'a_mt_player_hud_set_hotbar_itemcount' 
  },
  a_mt_player_hud_remove = { 
    name = 'a_mt_player_hud_remove' 
  },
  a_mt_player_override_day_night_ratio = { 
    name = 'a_mt_player_override_day_night_ratio' 
  },
  a_mt_player_set_breath = { 
    name = 'a_mt_player_set_breath' 
  },
  a_mt_player_set_clouds = { 
    name = 'a_mt_player_set_clouds' 
  },
  a_mt_player_set_eye_offset = { 
    name = 'a_mt_player_set_eye_offset' 
  },
  a_mt_player_set_inventory_formspec = { 
    name = 'a_mt_player_set_inventory_formspec' 
  },
  a_mt_player_set_look_horizontal = { 
    name = 'a_mt_player_set_look_horizontal' 
  },
  a_mt_player_set_look_vertical = { 
    name = 'a_mt_player_set_look_vertical' 
  },
  a_mt_player_set_physics_override = { 
    name = 'a_mt_player_set_physics_override' 
  },
  a_mt_player_set_sky = { 
    name = 'a_mt_player_set_sky' 
  },
  a_mt_punch_node = { 
    name = 'a_mt_punch_node' 
  },
  a_mt_raycast = { 
    name = 'a_mt_raycast' 
  },
  a_mt_record_protection_violation = { 
    name = 'a_mt_record_protection_violation' 
  },
  a_mt_remove_detached_inventory = { 
    name = 'a_mt_remove_detached_inventory' 
  },
  a_mt_remove_node = { 
    name = 'a_mt_remove_node' 
  },
  a_mt_remove_player = { 
    name = 'a_mt_remove_player' 
  },
  a_mt_remove_player_auth = { 
    name = 'a_mt_remove_player_auth' 
  },
  a_mt_rotate_and_place = { 
    name = 'a_mt_rotate_and_place' 
  },
  a_mt_rotate_node = { 
    name = 'a_mt_rotate_node' 
  },
  a_mt_sao_add_velocity = { 
    name = 'a_mt_sao_add_velocity' 
  },
  a_mt_sao_set_acceleration = { 
    name = 'a_mt_sao_set_acceleration' 
  },
  a_mt_sao_set_rotation = { 
    name = 'a_mt_sao_set_rotation' 
  },
  a_mt_sao_set_sprite = { 
    name = 'a_mt_sao_set_sprite' 
  },
  a_mt_sao_set_texture_mod = { 
    name = 'a_mt_sao_set_texture_mod' 
  },
  a_mt_sao_set_velocity = { 
    name = 'a_mt_sao_set_velocity' 
  },
  a_mt_sao_set_yaw = { 
    name = 'a_mt_sao_set_yaw' 
  },
  a_mt_send_join_message = { 
    name = 'a_mt_send_join_message' 
  },
  a_mt_send_leave_message = { 
    name = 'a_mt_send_leave_message' 
  },
  a_mt_serialize_schematic = { 
    name = 'a_mt_serialize_schematic' 
  },
  a_mt_set_acceleration = { 
    name = 'a_mt_set_acceleration' 
  },
  a_mt_set_node = { 
    name = 'a_mt_set_node' 
  },
  a_mt_set_node_level = { 
    name = 'a_mt_set_node_level' 
  },
  a_mt_set_player_password = { 
    name = 'a_mt_set_player_password' 
  },
  a_mt_set_timeofday = { 
    name = 'a_mt_set_timeofday' 
  },
  a_mt_set_velocity = { 
    name = 'a_mt_set_velocity' 
  },
  a_mt_show_formspec = { 
    name = 'a_mt_show_formspec' 
  },
  a_mt_sound_fade = { 
    name = 'a_mt_sound_fade' 
  },
  a_mt_sound_play = { 
    name = 'a_mt_sound_play' 
  },
  a_mt_sound_stop = { 
    name = 'a_mt_sound_stop' 
  },
  a_mt_spawn_tree = { 
    name = 'a_mt_spawn_tree' 
  },
  a_mt_stack_add_item = { 
    name = 'a_mt_stack_add_item' 
  },
  a_mt_stack_add_wear = { 
    name = 'a_mt_stack_add_wear' 
  },
  a_mt_stack_clear = { 
    name = 'a_mt_stack_clear' 
  },
  a_mt_stack_replace = { 
    name = 'a_mt_stack_replace' 
  },
  a_mt_stack_set_count = { 
    name = 'a_mt_stack_set_count' 
  },
  a_mt_stack_set_metadata = { 
    name = 'a_mt_stack_set_metadata' 
  },
  a_mt_stack_set_name = { 
    name = 'a_mt_stack_set_name' 
  },
  a_mt_stack_set_tool_capabilities = { 
    name = 'a_mt_stack_set_tool_capabilities' 
  },
  a_mt_stack_set_wear = { 
    name = 'a_mt_stack_set_wear' 
  },
  a_mt_stack_take_item = { 
    name = 'a_mt_stack_take_item'
  },
  a_mt_swap_node = { 
     name = 'a_mt_swap_node' 
  },
  a_mt_transforming_liquid_add = { 
    name = 'a_mt_transforming_liquid_add' 
  },
  a_mt_unban_player = { 
    name = 'a_mt_unban_player' 
  },
}

