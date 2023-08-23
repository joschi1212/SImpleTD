class_name Target extends Marker3D

@onready var camera : Camera3D = self.get_parent().get_node("Camera3D")
@onready var area : Area3D = $Area3D

func _ready():
	area.connect("body_entered", _on_area_entered)

func _on_area_entered(body):
	if body is CharacterBody3D:
		print(body)
		var state = body.get_node("Character/CharacterState")
		state.current_state = state.IDLEING
	

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		event = event as InputEventMouseButton
		var mouse_pos:Vector2 = event.position
		var ray_start:Vector3 = camera.project_ray_origin(mouse_pos)
		var ray_end:Vector3 = ray_start + camera.project_ray_normal(mouse_pos) * 1000
		var space_state = get_world_3d().direct_space_state
		var query = PhysicsRayQueryParameters3D.create(ray_start, ray_end)
		if space_state.intersect_ray(query):
			global_position = space_state.intersect_ray(query).position
			self.global_position
		
		if event.button_index == MOUSE_BUTTON_RIGHT:
			print("right")
		
		if event.button_index == MOUSE_BUTTON_LEFT:
			pass
			print("left")
