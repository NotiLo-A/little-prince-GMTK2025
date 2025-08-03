extends Node

var player: AudioStreamPlayer

func _ready():
	player = AudioStreamPlayer.new()
	add_child(player)
	var music_track = load("res://audio/music.wav")
	play_music(music_track)

func play_music(music : AudioStream):
	if player.playing:
		player.stop()

	player.stream = music
	player.volume_db = -20
	player.play()

func stop_music():
	player.stop()
