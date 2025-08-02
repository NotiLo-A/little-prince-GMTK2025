extends Sprite2D

func interact(carried_item: Node) -> void:
	print("interacted with watering can")
	GlobalNodes.prince.carried_item = self
	set_process(false)
	visible = false
