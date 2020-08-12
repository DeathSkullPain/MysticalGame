import copy

path = r'minetest_dev\worlds\Test\schems' + '\\'

in_file = path + 'tree_dark_green_medium.we'
out_file = path + 'out.txt'

marker = 'wool:yellow'

air = '_'

f = open(in_file)
data = f.read()
f.close()

empty_replacers = [
    '["meta"] = {["fields"] = {}, ["inventory"] = {}}, ',
    '["param1"] = 15, ',
    '["param2"] = 4, ',
    ]

for replacer in empty_replacers:
    data = data.replace(replacer, '')

node_replacers = [
    ['mystical_lands:leaves_dark_green_00', 's'],
    ['mystical_lands:leaves_dark_green_01', 'm'],
    ['mystical_lands:leaves_dark_green_02', 'l'],
    ['mystical_lands:branch_brown', 'b'],
    ['mystical_lands:bark_living_brown', 'r'],
    ['mystical_lands:log_light_brown', 't'],
    ['mystical_lands:very_soft_coarse_grain_light_gray_stone', 'u'],
    ['mystical_lands:soft_glassy_dark_olive_stone', 'h'],
    ]

for replacer in node_replacers:
    data = data.replace(replacer[0], replacer[1])

data = data.replace(marker, air)

splits = data.split('{["x"] = ')

max_x = 0
max_y = 0
max_z = 0

data = []

def get_param(source, start, end):
    i_start = source.index(start)
    i_end = source.index(end, i_start)
    i_start = i_start + len(start)
    param = source[i_start : i_end]

    return param

for split in splits[1:]:
    i_end = split.index(',')
    sx = split[:i_end]

    sy = get_param(split, '["y"] = ', ',')
    sz = get_param(split, '["z"] = ', ',')
    snode = get_param(split, '["name"] = "', '"}')

    ix = int(sx)
    if ix > max_x:
        max_x = ix
    iy = int(sy)
    if iy > max_y:
        max_y = iy
    iz = int(sz)
    if iz > max_z:
        max_z = iz

    data.append([ix, iy, iz, snode])

max_x = max_x + 1
max_y = max_y + 1
max_z = max_z + 1

schem = []
for x in range(max_x):
    y_slice = []
    for y in range(max_y):
        z_slice = []
        for z in range(max_z):
            z_slice.append(air)
        y_slice.append(z_slice)
    schem.append(y_slice)

for d in data:
    x = d[0]
    y = d[1]
    z = d[2]
    s = d[3]

    #print(x, y, z, s)
    schem[x][y][z] = s

out = 'local size = { x = ' + str(max_x) + ', ' + \
      'y = ' + str(max_y) + ', ' + \
      'z = ' + str(max_z) + ' }\n\n'

out += 'local ' + air + ' = { name = "air", prob = 0 }\n'
for replacer in node_replacers:
    out += 'local ' + replacer[1] + ' = { name = "' + \
           replacer[0] + '", prob = 255, force_place = false }\n'

out += '\nlocal data = {\n'

for z in range(max_z):
    for y in range(max_y):
        for x in range(max_x):
            out += schem[x][y][z] + ', '
        out += '\n'
    out += '\n'

out += '}'

f = open(out_file, 'w')
f.write(out)
f.close()

