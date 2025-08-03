extends MarginContainer

@export var item_icon: TextureRect
@export var watering_can_texture: Texture

func _ready() -> void:
	item_icon.visible = false

func _process(_delta: float) -> void:
	var prince: Prince = GlobalNodes.prince
	if prince == null:
		item_icon.visible = false
		return

	if prince.carried_item == null:
		item_icon.visible = false
		return

	var is_watering_can = prince.carried_item is WateringCan
	if is_watering_can:
		item_icon.visible = true
		item_icon.texture = watering_can_texture
		return

	item_icon.visible = false
