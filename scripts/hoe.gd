class_name Hoe extends Sprite2D

func interact(carried_item: Node) -> void:
	print("interacted with hoe")
	GlobalNodes.prince.pick_up_item(self)
