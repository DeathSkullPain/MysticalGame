local reg = minetest.register_node
local mod = 'mystical_lands:'
local mod_prefix = 'mystical_lands_'

mystical_lands.plants = {}
local p = mystical_lands.plants

function p.node_name(s)
  return mod .. s
end

function p.tex(s)
    return mod_prefix .. s .. '.png'
end



function p.register_log_type(nodes)
  for index, n in pairs(nodes) do
  reg(
      p.node_name(n.name),
      {
        description = n.description,
        tiles = {p.tex(n.name)},
        walkable = true,
        pointable = true,
        diggable = true,
        is_ground_content = false,
        groups = {choppy = 3, tree = 1, log = 1},
      }
    )
  end
end

function p.register_grass_type(nodes, groups)
  for index, n in pairs(nodes) do
  reg(
      p.node_name(n.name),
      {
        description = n.description,
        tiles = {p.tex(n.name)},
        drawtype = 'plantlike',
        paramtype = "light",
        walkable = false,
        pointable = true,
        sunlight_propagates = true,
        --buildable_to = true,
        diggable = true,
        is_ground_content = false,
        groups = groups,
      }
    )
  end
end

function p.register_bush_type(nodes, groups)
  for index, n in pairs(nodes) do
  reg(
      p.node_name(n.name),
      {
        description = n.description,
        tiles = {p.tex(n.name)},
        drawtype = 'plantlike',
        paramtype = "light",
        paramtype2 = 'meshoptions',
        param2 = 4,
        place_param2 = 4,
        walkable = false,
        pointable = true,
        sunlight_propagates = true,
        --buildable_to = true,
        diggable = true,
        is_ground_content = false,
        groups = groups,
      }
    )
  end
end

function p.register_allfaces_type(nodes, groups)
  for index, n in pairs(nodes) do
  reg(
      p.node_name(n.name),
      {
        description = n.description,
        tiles = {p.tex(n.name)},
        drawtype = 'allfaces_optional',
        paramtype = "light",
        walkable = false,
        pointable = true,
        sunlight_propagates = true,
        --buildable_to = true,
        diggable = true,
        is_ground_content = false,
        groups = groups,
      }
    )
  end
end

function p.register_branch_type(nodes)
  for index, n in pairs(nodes) do
    reg(
        p.node_name(n.name),
        {
          description = n.description,
          tiles = {p.tex(n.texture)},
          drawtype = "nodebox",
          node_box = {
            type = "connected",
            fixed = {{-1/4, -1/4, -1/4, 1/4, 1/4, 1/4}},
            -- connect_bottom =
            connect_front =  {{-1/4, -1/4, -1/2,  1/4,  1/4,  1/4}},
            connect_left =   {{-1/2, -1/4, -1/4,  1/4,  1/4,  1/4}},
            connect_back =   {{-1/4, -1/4, -1/4,  1/4,  1/4,  1/2}},
            connect_right =  {{-1/4, -1/4, -1/4,  1/2,  1/4,  1/4}},
            connect_top =    {{-1/4, -1/4, -1/4,  1/4,  1/2,  1/4}},
            connect_bottom = {{-1/4, -1/2, -1/4,  1/4,  1/4,  1/4}},
          },
          paramtype = "light",
          walkable = true,
          pointable = true,
          sunlight_propagates = true,
          --buildable_to = true,
          diggable = true,
          is_ground_content = false,
          connects_to = {'group:tree'},
          groups = { choppy = 1, tree = 1 , branch = 1},
        }
      )
  end
end

function p.register_bark_type(nodes)
  local d = 0.51 -- extra 0.01 because of visual bug
  for index, n in pairs(nodes) do
    reg(
        p.node_name(n.name),
        {
          description = n.description,
          tiles = {p.tex(n.texture)},
          drawtype = "nodebox",
          node_box = {
            type = "connected",
            fixed = {{0, 0, 0, 0, 0, 0}},
            -- connect_bottom =
            connect_front =  {{-1 * d, -1 * d,  -1 * d,  d,  d,  0}},
            connect_left =   {{-1 * d, -1 * d,  -1 * d,  0,  d,  d}},
            connect_back =   {{-1 * d, -1 * d,   0,  d,  d,  d}},
            connect_right =  {{0, -1 * d,  -1 * d,  d,  d,  d}},
            connect_top =    {{-1 * d, 0,  -1 * d,  d,  d,  d}},
            connect_bottom = {{-1 * d, -1 * d,  -1 * d,  d,  0,  d}},
          },
    
          paramtype = "light",
          walkable = true,
          pointable = true,
          sunlight_propagates = false,
          buildable_to = false,
          diggable = true,
          is_ground_content = false,
          connects_to = {'group:branch', 'group:log'},
          groups = { choppy = 1, tree = 1},
        }
      )
  end
end

local grasses = {
  { description = 'Small light grass', name = 'light_grass_small' },
  { description = 'Medium light grass', name = 'light_grass_medium' },
  { description = 'Large light grass', name = 'light_grass_large' },
  { description = 'Small grass', name = 'grass_small' },
  { description = 'Medium grass', name = 'grass_medium' },
  { description = 'Large grass', name = 'grass_large' },
  { description = 'Small dark grass', name = 'dark_grass_small' },
  { description = 'Medium dark grass', name = 'dark_grass_medium' },
  { description = 'Large dark grass', name = 'dark_grass_large' },
}
p.register_grass_type(grasses, {choppy = 3, grass = 1})


local bush_grass = {
  { description = 'Light bush grass', name = 'light_bush_grass' },
  { description = 'Dark bush grass', name = 'dark_bush_grass' },
  { description = 'Bush grass', name = 'bush_grass' },
}

p.register_grass_type(bush_grass, {choppy = 3, grass = 1})

-- logs
local small_leaves = {
  { description = 'Small brown leaves', name = 'leaves_brown_00' },
  { description = 'Small red leaves', name = 'leaves_red_00' },
  { description = 'Small light green leaves', name = 'leaves_light_green_00' },
  { description = 'Small dark green leaves', name = 'leaves_dark_green_00' },
  { description = 'Small purple leaves', name = 'leaves_purple_00' },
}
p.register_grass_type(small_leaves, {choppy = 3, leaves = 1, tree = 1})

local medium_leaves = {
  { description = 'Brown leaves', name = 'leaves_brown_01' },
  { description = 'Red leaves', name = 'leaves_red_01' },
  { description = 'Light green leaves', name = 'leaves_light_green_01' },
  { description = 'Dark green leaves', name = 'leaves_dark_green_01' },
  { description = 'Purple leaves', name = 'leaves_purple_01' },
}
p.register_bush_type(medium_leaves, {choppy = 3, leaves = 1, tree = 1})

local thick_leaves = {
  { description = 'Thick brown leaves', name = 'leaves_brown_02' },
  { description = 'Thick red leaves', name = 'leaves_red_02' },
  { description = 'Thick light green leaves', name = 'leaves_light_green_02' },
  { description = 'Thick dark green leaves', name = 'leaves_dark_green_02' },
  { description = 'Thick purple leaves', name = 'leaves_purple_02' },
}
p.register_allfaces_type(thick_leaves, {choppy = 3, leaves = 1, tree = 1})

local branches = {
  { description = 'Brown branch', name = 'branch_brown', texture = 'bark_brown' },
}
p.register_branch_type(branches)

local barks = {
  { description = 'Living brown bark', name = 'bark_living_brown', texture = 'bark_brown'},
}
p.register_bark_type(barks)

local log_nodes = {
  { description = 'Light brown tree log', name = 'log_light_brown' },
}
p.register_log_type(log_nodes)


function p.make_schematic_tree_dark_green_medium()
  local p100 = 255
  local p75 = math.floor(255 * 0.75)
  local p50 = math.floor(255 * 0.6)
  
  local size = { x = 15, y = 18, z = 15 }

  local _ = { name = "air", param1 = 0 }
  local s = { name = "mystical_lands:leaves_dark_green_00", param1 = p50, force_place = false }
  local m = { name = "mystical_lands:leaves_dark_green_01", param1 = p75, param2 = 4, force_place = false }
  local l = { name = "mystical_lands:leaves_dark_green_02", param1 = p75, force_place = false }
  local b = { name = "mystical_lands:branch_brown", param1 = p100, force_place = true }
  local r = { name = "mystical_lands:bark_living_brown", param1 = p100, force_place = true }
  local t = { name = "mystical_lands:log_light_brown", param1 = p100, force_place = true }
  local u = { name = "mystical_lands:very_soft_coarse_grain_light_gray_stone", param1 = p100, force_place = true }
  local h = { name = "mystical_lands:soft_glassy_dark_olive_stone", param1 = p100, force_place = true }

  local data = {
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, s, s, s, _, _, _, _, _, _, 
    _, _, _, _, _, _, s, s, s, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 

    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, s, s, s, _, _, _, _, _, _, 
    _, _, _, _, _, _, s, s, s, _, _, _, _, _, _, 
    _, _, _, _, s, s, s, m, s, s, s, _, _, _, _, 
    _, _, _, _, s, s, s, s, s, s, s, _, _, _, _, 
    _, _, _, _, _, s, s, s, s, s, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 

    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, s, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, s, _, _, _, _, _, _, _, 
    _, _, _, _, _, s, s, m, s, s, _, _, _, _, _, 
    _, _, _, _, _, s, s, m, s, s, _, _, _, _, _, 
    _, _, _, s, s, m, m, l, m, m, s, s, _, _, _, 
    _, _, _, s, s, s, s, m, s, s, s, s, _, _, _, 
    _, _, _, _, s, s, s, s, s, s, s, _, _, _, _, 
    _, _, _, _, _, s, s, s, s, s, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 

    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, s, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, s, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, s, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, s, m, s, _, _, _, _, _, _, 
    _, _, _, _, s, s, m, l, m, s, s, _, _, _, _, 
    _, _, _, _, s, s, m, l, m, s, s, _, _, _, _, 
    _, _, s, s, m, m, l, b, l, m, m, s, s, _, _, 
    _, _, s, s, s, m, m, l, m, m, s, s, s, _, _, 
    _, _, _, s, s, s, s, m, s, s, s, s, _, _, _, 
    _, _, _, _, s, s, s, s, s, s, s, _, _, _, _, 
    _, _, _, _, _, _, s, s, s, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 

    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, s, _, s, _, _, _, _, _, _, _, 
    _, _, _, _, _, s, s, m, s, s, _, _, _, _, _, 
    _, _, _, _, _, s, m, l, m, s, _, _, _, _, _, 
    _, _, _, s, s, m, l, b, l, m, s, s, _, _, _, 
    _, _, _, s, s, m, l, b, l, m, s, s, _, _, _, 
    _, s, s, m, m, l, b, b, b, l, m, m, s, s, _, 
    _, s, s, s, m, m, l, b, l, m, m, s, s, s, _, 
    _, _, s, s, s, m, m, l, m, m, s, s, s, _, _, 
    _, _, _, s, s, s, s, m, s, s, s, s, _, _, _, 
    _, _, _, _, _, _, s, s, s, s, _, _, _, _, _, 
    _, _, _, _, _, _, _, s, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 

    _, _, _, _, _, _, _, u, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, s, _, _, _, _, 
    _, _, _, _, s, _, _, _, _, _, s, _, _, _, _, 
    _, _, _, _, s, _, _, _, _, _, s, _, _, _, _, 
    _, _, s, s, m, _, _, b, _, _, m, s, s, _, _, 
    _, _, s, s, m, _, _, _, _, _, m, s, s, _, _, 
    _, s, m, m, l, _, l, l, l, _, l, m, m, s, _, 
    _, s, s, m, m, s, m, l, m, s, m, m, s, s, _, 
    _, s, s, s, m, m, s, _, s, m, m, s, s, s, _, 
    _, _, s, s, s, s, m, l, m, s, s, s, s, _, _, 
    _, _, _, _, _, s, s, m, s, s, s, _, _, _, _, 
    _, _, _, _, _, _, s, s, s, _, _, _, _, _, _, 
    _, _, _, _, _, _, s, s, s, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 

    _, _, _, _, _, _, _, u, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, u, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, r, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, r, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, r, _, _, _, _, _, _, _, 
    _, _, _, _, s, _, _, r, _, _, s, _, _, _, _, 
    _, _, _, s, m, _, _, r, _, _, m, s, _, _, _, 
    _, s, s, m, l, _, _, r, _, _, l, m, s, s, _, 
    _, s, s, m, l, _, _, r, _, _, l, m, s, s, _, 
    s, s, m, l, b, l, _, r, _, l, b, l, m, s, s, 
    s, s, s, m, l, m, _, _, _, m, l, m, s, s, s, 
    _, s, s, s, m, s, _, _, _, s, m, s, s, s, _, 
    _, _, s, s, s, m, l, b, l, m, s, s, s, _, _, 
    _, _, _, s, s, s, m, l, m, s, s, s, _, _, _, 
    _, _, _, _, _, s, s, m, s, s, _, _, _, _, _, 
    _, _, _, _, _, s, s, m, s, s, _, _, _, _, _, 
    _, _, _, _, _, _, _, s, _, _, _, _, _, _, _, 

    _, _, _, _, _, u, u, h, u, u, _, _, _, _, _, 
    _, _, _, _, _, _, u, u, u, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, u, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, r, t, r, _, _, _, _, _, _, 
    _, _, _, s, _, _, r, t, r, _, _, s, _, _, _, 
    _, _, _, s, s, _, r, t, r, _, s, s, _, _, _, 
    _, _, s, s, m, _, r, t, r, _, m, s, s, _, _, 
    _, _, s, m, l, _, r, t, r, _, l, m, s, _, _, 
    _, s, m, l, b, b, r, t, r, b, b, l, m, s, _, 
    _, s, m, l, b, _, r, t, r, _, b, l, m, s, _, 
    s, m, l, b, b, l, r, t, r, l, b, b, l, m, s, 
    s, s, m, l, b, l, _, r, _, l, b, l, m, s, s, 
    _, s, s, m, l, m, _, b, _, m, l, m, s, s, _, 
    _, _, s, s, m, l, b, b, b, l, m, s, s, _, _, 
    _, _, _, s, s, m, l, b, l, m, s, s, _, _, _, 
    _, _, _, _, s, s, m, l, m, s, s, _, _, _, _, 
    _, _, _, _, _, s, m, m, m, s, _, _, _, _, _, 
    _, _, _, _, _, _, s, s, s, _, _, _, _, _, _, 

    _, _, _, _, _, _, _, u, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, u, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, r, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, r, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, r, _, _, _, _, _, _, _, 
    _, _, _, _, s, _, _, r, _, _, s, _, _, _, _, 
    _, _, _, s, m, _, _, r, _, _, m, s, _, _, _, 
    _, s, s, m, l, _, _, r, _, _, l, m, s, s, _, 
    _, s, s, m, l, _, _, r, _, _, l, m, s, s, _, 
    s, s, m, l, b, l, _, r, _, l, b, l, m, s, s, 
    s, s, s, m, l, m, _, _, _, m, l, m, s, s, s, 
    _, s, s, s, m, s, _, _, _, s, m, s, s, s, _, 
    _, _, s, s, s, m, l, b, l, m, s, s, s, _, _, 
    _, _, _, s, s, s, m, l, m, s, s, s, _, _, _, 
    _, _, _, _, _, s, s, m, s, s, _, _, _, _, _, 
    _, _, _, _, _, s, s, m, s, s, _, _, _, _, _, 
    _, _, _, _, _, _, _, s, _, _, _, _, _, _, _, 

    _, _, _, _, _, _, _, u, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, s, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, s, _, _, _, _, _, s, _, _, _, _, 
    _, _, _, _, s, _, _, _, _, _, s, _, _, _, _, 
    _, _, s, s, m, _, _, b, _, _, m, s, s, _, _, 
    _, _, s, s, m, _, _, _, _, _, m, s, s, _, _, 
    _, s, m, m, l, _, l, l, l, l, l, m, m, s, _, 
    _, s, s, m, m, s, m, l, m, m, m, m, s, s, _, 
    _, s, s, s, m, m, s, m, s, m, m, s, s, s, _, 
    _, _, s, s, s, s, m, l, m, s, s, s, s, _, _, 
    _, _, _, _, s, s, s, m, s, s, s, _, _, _, _, 
    _, _, _, _, _, _, s, s, s, _, _, _, _, _, _, 
    _, _, _, _, _, _, s, s, s, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 

    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, s, _, s, _, _, _, _, _, 
    _, _, _, _, _, s, s, m, s, s, _, _, _, _, _, 
    _, _, _, _, _, s, m, l, m, s, _, _, _, _, _, 
    _, _, _, s, s, m, l, b, l, m, s, s, _, _, _, 
    _, _, _, s, s, m, l, b, l, m, s, s, _, _, _, 
    _, s, s, m, m, l, b, b, b, l, m, m, s, s, _, 
    _, s, s, s, m, m, l, b, l, m, m, s, s, s, _, 
    _, _, s, s, s, m, m, l, m, m, s, s, s, _, _, 
    _, _, _, s, s, s, s, m, s, s, s, s, _, _, _, 
    _, _, _, _, _, s, s, s, s, s, _, _, _, _, _, 
    _, _, _, _, _, _, _, s, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 

    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, s, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, s, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, s, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, s, m, s, _, _, _, _, _, _, 
    _, _, _, _, s, s, m, l, m, s, s, _, _, _, _, 
    _, _, _, _, s, s, m, l, m, s, s, _, _, _, _, 
    _, _, s, s, m, m, l, b, l, m, m, s, s, _, _, 
    _, _, s, s, s, m, m, l, m, m, s, s, s, _, _, 
    _, _, _, s, s, s, s, m, s, s, s, s, _, _, _, 
    _, _, _, _, s, s, s, s, s, s, s, _, _, _, _, 
    _, _, _, _, _, _, s, s, s, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 

    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, s, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, s, _, _, _, _, _, _, _, 
    _, _, _, _, _, s, s, m, s, s, _, _, _, _, _, 
    _, _, _, _, _, s, s, m, s, s, _, _, _, _, _, 
    _, _, _, s, s, m, m, l, m, m, s, s, _, _, _, 
    _, _, _, s, s, s, s, m, s, s, s, s, _, _, _, 
    _, _, _, _, s, s, s, s, s, s, s, _, _, _, _, 
    _, _, _, _, _, s, s, s, s, s, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 

    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, s, s, s, _, _, _, _, _, _, 
    _, _, _, _, _, _, s, s, s, _, _, _, _, _, _, 
    _, _, _, _, s, s, s, m, s, s, s, _, _, _, _, 
    _, _, _, _, s, s, s, s, s, s, s, _, _, _, _, 
    _, _, _, _, _, s, s, s, s, s, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 

    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, s, s, s, _, _, _, _, _, _, 
    _, _, _, _, _, _, s, s, s, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 
    _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 

  }
  return { size = size, data = data }
end
