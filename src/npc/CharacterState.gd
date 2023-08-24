class_name CharacterState extends Node3D

const MOVING = 0
const ATTACKING = 1
const IDLEING = 2
const DYING = 3

@onready var current_state = 0
@onready var animation_tree = $AnimationTree

signal state_changed(NPC : CharacterBody3D, new_state : int)

func _ready():
	pass

func get_current_state():
	return current_state

func set_current_state(new_state):
	print(new_state)
	current_state = new_state
	emit_signal("state_changed", self.get_parent().get_parent(), current_state)


func _process(delta):
	var moving : bool = current_state == MOVING
	var attacking : bool = current_state == ATTACKING
	var idleing : bool = current_state == IDLEING
	var dying : bool = current_state == DYING
	animation_tree["parameters/conditions/moving"] = moving
	# animation_tree["parameters/conditions/attacking"] = attacking
	animation_tree["parameters/conditions/idleing"] = idleing
	# animation_tree["parameters/conditions/dying"] = dying
