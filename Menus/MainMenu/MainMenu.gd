extends Control

enum CHANGE_STATE{
  none,
  new_game,
  continue_game,
  scores,
  settings,
  quit
}

var current_change = CHANGE_STATE.none

func _ready():
	_load_translations()
	get_node("Transitioner").open()
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
	get_node("Transitioner").close()
	
	if current_change == CHANGE_STATE.none:
		current_change = CHANGE_STATE.new_game


func _on_Continue_pressed():
	Saver.is_in_game = true
	MenuStatus.GameIsContinue()
	get_node("Transitioner").close()
	if current_change == CHANGE_STATE.none:
		current_change = CHANGE_STATE.continue_game


func _on_Scores_pressed():
	get_node("Transitioner").close()
	if current_change == CHANGE_STATE.none:
		current_change = CHANGE_STATE.scores


func _on_Settings_pressed():
	get_node("Transitioner").close()
	if current_change == CHANGE_STATE.none:
		current_change = CHANGE_STATE.settings


func _on_Exit_pressed():
	get_node("Transitioner").close()
	if current_change == CHANGE_STATE.none:
		current_change = CHANGE_STATE.quit
	


func _on_Transitioner_transition_finished():
	if current_change == CHANGE_STATE.new_game:
		get_tree().change_scene_to(load("res://Maps/ChunkTestWorld.tscn"))
	elif current_change == CHANGE_STATE.continue_game:
		get_tree().change_scene_to(load("res://Maps/ChunkTestWorld.tscn"))
	elif current_change == CHANGE_STATE.scores:
		get_tree().change_scene_to(load("res://Menus/TopScoreMenu/TopScore.tscn"))
	elif current_change == CHANGE_STATE.settings:
		get_tree().change_scene_to(load("res://Menus/Settings/SettingsMenu.tscn"))
	elif current_change == CHANGE_STATE.quit:
		get_tree().quit(1)
