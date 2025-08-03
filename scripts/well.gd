extends Sprite2D

func interact(carried_item: Node) -> void:
	if carried_item is WateringCan:
		carried_item.water = carried_item.water_max
