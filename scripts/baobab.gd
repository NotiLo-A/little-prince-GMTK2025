extends Node2D

enum States { None, Sprout, GrownTree }

@export var sprout_sprite: Sprite2D
@export var tree_sprite: Sprite2D

var state := States.None

func _ready() -> void:
	update_state()
	randomize()

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

func _on_high() -> void:
	pass # Replace with function body.

func _on_low() -> void:
	var proc = randf() > 0.8
	print(proc)
	if proc:
		grow()

func grow():
	state += 1

	if state > States.GrownTree:
		state = States.GrownTree

	update_state()
