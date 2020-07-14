extends Control




func _on_NewGame_pressed():
	get_tree().change_scene_to(load("res://Maps/ChunkTestWorld.tscn"))


func _on_Continue_pressed():
	pass # Replace with function body.


func _on_Scores_pressed():
	pass # Replace with function body.


func _on_Settings_pressed():
	pass # Replace with function body.


func _on_Exit_pressed():
	get_tree().quit(1)
