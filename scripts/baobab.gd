extends Node2D

enum States { None, Sprout, GrownTree }

@onready var sprout_sprite := $Sprout
@onready var tree_sprite := $Tree

@export var slow_range := 100
@export var slow_rate := 0.5
@export var change_to_grow := 0.8

var state := States.None
var prince_was_in_range: bool

func interact(carried_item: Node2D) -> void:
	if carried_item != Hoe:
		return
	if state == States.Sprout:
		state = States.None
	update_state()

func _ready() -> void:
	update_state()
	randomize()

func _process(_delta: float) -> void:
	if state != States.GrownTree:
		return

	var prince = GlobalNodes.prince as Prince
	if prince == null:
		return

	var distance = prince.position.distance_to(position)
	if distance < slow_range:
		if prince_was_in_range:
			return
		prince_was_in_range = true
		prince.slow_down(slow_rate)
	else:
		if !prince_was_in_range:
			return
		prince_was_in_range = false
		prince.reset_speed()

func update_state():
	$Area2D.input_pickable = state != States.None
	if state == States.Sprout:
		sprout_sprite.visible = true
		tree_sprite.visible = false
	elif state == States.GrownTree:
		sprout_sprite.visible = false
		tree_sprite.visible =  true

		var prince = GlobalNodes.prince as Prince
		var distance = prince.position.distance_to(position)

		if distance < slow_range:
			prince_was_in_range = true
			prince.slow_down(slow_rate)

	else:
		sprout_sprite.visible = false
		tree_sprite.visible =  false

func _on_high() -> void:
	pass # Replace with function body.

func _on_low() -> void:
	var proc = randf() < change_to_grow
	if proc:
		grow()

func grow():
	state += 1
	if state > States.GrownTree:
		state = States.GrownTree
	update_state()
