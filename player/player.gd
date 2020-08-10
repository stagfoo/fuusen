# A Rigidbody Controller for basic 3D movement

extends RigidBody

# not sure what to put here to get proper turning
var turn_speed = Vector3(0,0,0.1)
var jump_speed = Vector3(0,3,0)
# not sure what to put here to get proper movement
var movement_speed = Vector3(3,0,0)

# The direction in which to conduct a raycast to check for jumping
var floor_jump_dir = Vector3(0,1,0)

# jump_flag
var jump_enabled = true

# Add input action dependencies if not present
func _ready():
	pass

var base_av = get_angular_velocity()
func _integrate_forces(state):
	var anguar = get_angular_velocity()
	# Detect input and alter the state accordingly
	if Input.is_action_pressed("ui_left"):
		state.set_linear_velocity(-movement_speed)
		state.set_angular_velocity(turn_speed)
	if Input.is_action_pressed("ui_right"):
		state.set_angular_velocity(-turn_speed)
		state.set_linear_velocity(movement_speed)
	if Input.is_action_pressed("jump"):
		state.set_linear_velocity(jump_speed)
		state.set_angular_velocity(-anguar)
		

