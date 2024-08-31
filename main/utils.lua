-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.

local DISPLAY_WIDTH = 1280
local DISPLAY_HEIGHT = 720

local OFFSET = 64

function random_position()
	local x = math.random(OFFSET, DISPLAY_WIDTH - 2 * OFFSET)
	local y = math.random(OFFSET, DISPLAY_HEIGHT - 2 * OFFSET)
	return vmath.vector3(x, y, 1.0)
end
