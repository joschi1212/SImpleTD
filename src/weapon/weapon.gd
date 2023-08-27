extends Node3D

@export var projectile : PackedScene

@onready var shoot_timer : Timer = $ShootTimer

func _ready():
	shoot_timer.connect("timeout", shoot)


func shoot():
	var p = projectile.instantiate()
	get_tree().root.add_child(p)
	

func _process(delta):
	pass
