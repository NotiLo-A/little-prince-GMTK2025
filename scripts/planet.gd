extends Sprite2D

@export var day_length := 100 # seconds
var rotation_speed := 2 * PI / day_length # rad/s

func _ready() -> void:
	for node in get_tree().get_nodes_in_group("interactive"):
		node.add_child(preload("res://scenes/glow_by_mouse.tscn").instantiate())

func _process(delta: float) -> void:
	rotation -= rotation_speed * delta
