extends Sprite2D

@export var day_length := 100.0 # seconds
var rotation_speed: float

func _ready() -> void:
	# this line can not be in field declaration. because then it'll ignore value set in editor
	rotation_speed = 2 * PI / day_length # rad/s
	
	GlobalNodes.planet = self
	for node in get_tree().get_nodes_in_group("interactive"):
		node.add_child(preload("res://scenes/outline_by_mouse.tscn").instantiate())

func _process(delta: float) -> void:
	rotation -= rotation_speed * delta
