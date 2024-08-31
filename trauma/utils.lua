-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.

local UP = vmath.vector3(0, 1, 0)
local RAD_180 = math.pi

local function angle_to_player(game_obj)
	local self_pos = game_obj.get_position()
	local target_pos = go.get_position("/player#sprite")
	return -math.atan2(target_pos.x - self_pos.x, target_pos.y - self_pos.y)
end

local function distance_to_player(game_obj)
	local self_pos = game_obj.get_position()
	local target_pos = go.get_position("/player#sprite")
	return vmath.length(self_pos, target_pos)
end

function move_trauma_on_update(game_obj, speed, dt)
	local current_angle = math.rad(game_obj.get(".", "euler.z"))
	local target_angle = angle_to_player(game_obj)
	-- rotate towards the target angle
	-- spherical interpolation towards the target rotation
	-- tweak rotation speed to turn faster
	local current_rotation = game_obj.get_rotation()
	local target_rotation = vmath.quat_rotation_z(target_angle)
	local rotation_speed = 4 -- tweak this!
	local rotation = vmath.slerp(rotation_speed * dt, current_rotation, target_rotation)
	game_obj.set_rotation(rotation)

	-- move in current direction
	local direction = vmath.rotate(rotation, UP)
	local distance = speed * dt
	game_obj.set_position(game_obj.get_position() + direction * distance)
end