extends MarginContainer

@export var item_icon: TextureRect
@export var watering_can_texture: Texture

@export var counter_label: Label

func _ready() -> void:
	item_icon.visible = false

func _process(_delta: float) -> void:
	var prince: Prince = GlobalNodes.prince
	if prince == null:
		hide_all()
		return

	if prince.carried_item == null:
		hide_all()
		return

	if prince.carried_item is WateringCan:
		show_water(prince.carried_item)
		return

	hide_all()

func hide_all():
	item_icon.visible = false
	counter_label.visible = false

func show_water(watering_can: WateringCan):
	item_icon.texture = watering_can_texture
	counter_label.text = str(watering_can.water) + "/" + str(watering_can.water_max)

	item_icon.visible = true
	counter_label.visible = true
