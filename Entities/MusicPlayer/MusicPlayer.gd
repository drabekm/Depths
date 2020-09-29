extends Node

var index = 0
var max_index = 7
var music = [
preload("res://Music/02 Failien Funk.ogg"),
preload("res://Music/02 World Nap.ogg"),
preload("res://Music/03 Ferrous Rage.ogg"),
preload("res://Music/04 Cold as Steel.ogg"),
preload("res://Music/04 Shell Shock Shake.ogg"),
preload("res://Music/05 Highway Slaughter.ogg"),
preload("res://Music/07 City of Iron.ogg")]

func _ready():
	print("AAAAAAAAAA")
	print(log(ProjectSettings.get_setting("audio/music")) * 20)
	print("AAAAAAAAAA")
	$AudioStreamPlayer2D.volume_db = log(ProjectSettings.get_setting("audio/music")) * 20
	randomize()
	index = randi() % (max_index - 1)
	$AudioStreamPlayer2D.stream = music[index]
	$AudioStreamPlayer2D.play()




func _on_AudioStreamPlayer2D_finished():
	index = (index + 1) % max_index
	$AudioStreamPlayer2D.stream = music[index]
