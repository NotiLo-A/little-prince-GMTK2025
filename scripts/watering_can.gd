extends Sprite2D

class_name WateringCan

@export var water_max := 1

var water := water_max

func interact(carried_item: Node) -> void:
	print("interacted with watering can")
	GlobalNodes.prince.pick_up_item(self)
