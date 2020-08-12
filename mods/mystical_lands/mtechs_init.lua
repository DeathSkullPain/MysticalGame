local ml = mystical_lands
ml.mtechs = nil

function ml.mtechs_lbm(position, node)
  local gig = minetest.get_item_group
  local mtechs = ml.mtechs
  local position_cid = mtechs.get_cid_by_name('node_position')
  local components = {position_cid}
  
  -- fall if nothing under
  if gig(node.name, ml.append_mod_name('falling') ~= 0 then
    local cid = mtechs.get_cid_by_name('falling_node')
    components[#components + 1] = cid
  end
  
  -- fall if greater than 45 degree slope
  if gig(node.name, ml.append_mod_name('45_angle_of_repose') ~= 0 then
    local cid = mtechs.get_cid_by_name('_45_angle_of_repose')
    components[#components + 1] = cid
  end
  
  -- pile into 45 degree slope when stopping
  if gig(node.name, ml.append_mod_name('45_angle_stacking') ~= 0 then
    local cid = mtechs.get_cid_by_name('_45_angle_stacking')
    components[#components + 1] = cid
  end
  
  mtechs.add_entity(node.name, components)
end

local lbm = {
    label = 'Mystical Lands MTechs LBM',
    name = ml.append_mod_prefix('mtechs_lbm'),
    node_names = {'group:' .. ml.append_mod_name('mtechs')},
    run_at_every_load = true,
    action =  ml.mtechs_lbm
}

function ml.mtechs_init(mtechs)
  ml.mtechs = mtechs
  minetest.register_lbm(lbm)
end

