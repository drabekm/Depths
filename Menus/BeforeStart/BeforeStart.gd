extends Control


var map = preload("res://Maps/ChunkTestWorld.tscn")



func _ready():
	pass # Replace with function body.


func _on_Button_pressed():
	PlayerData.player_name = $MarginContainer/CenterContainer/VBoxContainer/LineEdit.text
	get_tree().change_scene_to(map)
