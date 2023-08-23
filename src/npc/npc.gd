class_name NPC extends CharacterBody3D

var speed = 2
var accel = 10
var speed_turn = 10
var accel_turn = 2

const MODE_CONSTANT = 0
const MODE_SMOOTH = 1
const mode = MODE_SMOOTH


@onready var nav: NavigationAgent3D = $NavigationAgent3D
@onready var state : CharacterState = get_node("Character/CharacterState")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		event = event as InputEventMouseButton
		if event.button_index == MOUSE_BUTTON_RIGHT:
			state.current_state = state.ATTACKING
		if event.button_index == MOUSE_BUTTON_LEFT:
			state.current_state = state.MOVING


func _physics_process(delta):
	var direction = Vector3()
	
	nav.target_position = get_parent().get_node("target").global_position
	
	direction = nav.get_next_path_position() - global_position
	direction = direction.normalized()
	var angle = 0
	if mode == MODE_CONSTANT:
		var front = -transform.basis.z
		angle = Vector2(front.x, front.z).angle_to(Vector2(direction.x, direction.z))
		var s = sign(angle)
		if(rad_to_deg(angle) <= 177):
			rotate_y(speed_turn * delta * s)
	elif mode == MODE_SMOOTH:
		angle = atan2(direction.x, direction.z)
		rotation.y = lerp_angle(rotation.y, angle, delta * speed_turn)
	
	if (state.get_current_state() == state.MOVING):
		
		if(sign(rad_to_deg(angle)) <= 10):
			velocity = velocity.lerp(direction * speed, accel_turn * delta)
			move_and_slide()
		else:
			velocity = Vector3.ZERO
