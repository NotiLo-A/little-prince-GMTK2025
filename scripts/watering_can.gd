extends Sprite2D

class_name WateringCan

var water := 3

func interact(carried_item: Node) -> void:
	print("interacted with watering can")
	GlobalNodes.prince.carried_item = self
	set_process(false)
	visible = false
