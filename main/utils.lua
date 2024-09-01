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