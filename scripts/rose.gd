extends Sprite2D

@export var textures: Array[Texture]
@export var sprite: Sprite2D

var index := 0

var is_on_last_stage: bool

func _ready() -> void:
	GameStaticData.loop = 0
	is_on_last_stage = false

func interact(carried_item: Node) -> void:
	if !carried_item is WateringCan:
		return

	var wateringCan = carried_item as WateringCan
	if wateringCan.water <= 0:
		return

	wateringCan.water -= 1
	restore_state()

func _on_off_screen_updater_on_highest_position() -> void:
	GameStaticData.loop += 1

	if (is_on_last_stage):
		game_over()

func _on_off_screen_updater_on_lowest_position() -> void:
	dry()

func restore_state():
	change_state(-1)

func dry():
	change_state(+1)

func change_state(value: int):
	index += value

	var last_index = textures.size() - 1
	index = clamp(index, 0, last_index);

	is_on_last_stage = index >= last_index

	sprite.texture = textures[index]

func game_over():
	GameStaticData.game_over("Rose dried")
