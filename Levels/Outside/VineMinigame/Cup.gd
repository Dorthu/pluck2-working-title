extends KinematicBody2D

var tilt = 0
var prevVelocity = 0

const ACCEL_MOD: float = 0.5
const CORRECT_RATE = 4
const MOVE_SCALE_FACTOR = 6
const TILT_SCALE_FACTOR = 0.15

func _physics_process(delta: float):
	var cur_position = position
	var target_position = get_local_mouse_position()
	var forceDir = cur_position.linear_interpolate(target_position, 1)
	forceDir.y = 0 # no vertical force
	move_and_slide(forceDir * MOVE_SCALE_FACTOR)
	
	var xAccel = forceDir.length() * TILT_SCALE_FACTOR
	if forceDir.x < 0:
		xAccel *= -1
		
	if abs(xAccel) > 5:
		tilt += xAccel * ACCEL_MOD
		tilt = clamp(tilt, -120, 120)
	elif tilt < -10:
		tilt += CORRECT_RATE
	elif tilt > 10:
		tilt -= CORRECT_RATE
	$Body.rotation_degrees = tilt
