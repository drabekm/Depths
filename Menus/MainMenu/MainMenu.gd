extends Control

func _ready():
	_load_translations()
	if Saver.continue_data_ready:
		get_node("VBoxContainer/Continue").disabled = false

func _load_translations():
	get_node("VBoxContainer/NewGame").text = Translator.translate(get_node("VBoxContainer/NewGame").text)
	get_node("VBoxContainer/Continue").text = Translator.translate(get_node("VBoxContainer/Continue").text)
	get_node("VBoxContainer/Scores").text = Translator.translate(get_node("VBoxContainer/Scores").text)
	get_node("VBoxContainer/Settings").text = Translator.translate(get_node("VBoxContainer/Settings").text)
	get_node("VBoxContainer/Exit").text = Translator.translate(get_node("VBoxContainer/Exit").text)


func _on_NewGame_pressed():
	Saver.is_in_game = true
	MenuStatus.GameIsNew()
	Saver.delete_save_files()
	PlayerData.reset()
	GlobalMapData.reset()
	get_tree().change_scene_to(load("res://Maps/ChunkTestWorld.tscn"))


func _on_Continue_pressed():
	Saver.is_in_game = true
	MenuStatus.GameIsContinue()
	get_tree().change_scene_to(load("res://Maps/ChunkTestWorld.tscn"))


func _on_Scores_pressed():
	get_tree().change_scene_to(load("res://Menus/TopScoreMenu/TopScore.tscn"))


func _on_Settings_pressed():
	get_tree().change_scene_to(load("res://Maps/WaterTest.tscn"))


func _on_Exit_pressed():
	get_tree().quit(1)
