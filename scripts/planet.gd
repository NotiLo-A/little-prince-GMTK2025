extends Sprite2D

const day_length := 100 # seconds
const rotation_speed = 2 * PI / day_length # rad/s

func _ready() -> void:
	for node in get_tree().get_nodes_in_group("interactive"):
		node.add_child(preload("res://scenes/outline_by_mouse.tscn").instantiate())

func _process(delta: float) -> void:
	rotation -= rotation_speed * delta
