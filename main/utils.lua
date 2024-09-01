-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.

local DISPLAY_WIDTH = 15 * 128
local DISPLAY_HEIGHT = 17 * 128

local OFFSET = 192

function random_position()
	local x = math.random(OFFSET, DISPLAY_WIDTH - 2 * OFFSET)
	local y = math.random(OFFSET, DISPLAY_HEIGHT - 2 * OFFSET)
	return vmath.vector3(x, y, 1.0)
end

function is_in(value, collection)
	for _, i in ipairs(collection) do
		if i == value then
			return true
		end
	end
	return false
end

function distance(x1, y1, x2, y2)
	return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
end

function is_position_valid(position, existing_objects)
	local min_distance = 300
	for _, obj in ipairs(existing_objects) do
		if distance(position.x, position.y, obj.x, obj.y) < min_distance then
			return false
		end
	end
	return true
end
