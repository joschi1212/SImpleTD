extends Node3D

const MOVING = 0
const ATTACKING = 1
const IDLEING = 2
const DYING = 3

@onready var current_state = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_current_state():
	return current_state

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
