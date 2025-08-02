extends Sprite2D

@export var textures: Array[Texture]
@export var sprite: Sprite2D

var index := 0

var is_on_last_stage: bool

func _ready() -> void:
	is_on_last_stage = false

func interact(carried_item: Node) -> void:
	print("interacted with rose")

func _on_off_screen_updater_on_highest_position() -> void:
	if (is_on_last_stage):
		game_over()

func _on_off_screen_updater_on_lowest_position() -> void:
	dry()

func dry():
	index += 1
	index = clamp(index, 0, textures.size() - 1);

	is_on_last_stage = index >= textures.size() - 1

	sprite.texture = textures[index]

func game_over():
	get_tree().change_scene_to_file("res://scenes/game_over_screen.tscn")
