class_name CharacterState extends Node3D

const MOVING = 0
const ATTACKING = 1
const IDLEING = 2
const DYING = 3

@onready var current_state = 0

signal state_changed(NPC : CharacterBody3D, new_state : int)

func _ready():
	pass

func get_current_state():
	return current_state

func set_current_state(new_state):
	current_state = new_state
	emit_signal("state_changed", self.parent.parent.parent, current_state)


func _process(delta):
	pass
