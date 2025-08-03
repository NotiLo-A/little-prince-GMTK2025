extends Node2D

enum States { None, Sprout, GrownTree }

@export var sprout_sprite: Sprite2D
@export var tree_sprite: Sprite2D

var state := States.None

func _ready() -> void:
	update_state()

func update_state():
	if state == States.Sprout:
		sprout_sprite.visible = true
		tree_sprite.visible = false
	elif state == States.GrownTree:
		sprout_sprite.visible = false
		tree_sprite.visible =  true
	else:
		sprout_sprite.visible = false
		tree_sprite.visible =  false
		
