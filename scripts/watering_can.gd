extends Sprite2D

class_name WateringCan

@export var water_max := 3

var water := water_max

func interact(carried_item: Node) -> void:
	print("interacted with watering can")
	GlobalNodes.prince.carried_item = self
	set_process(false)
	visible = false
