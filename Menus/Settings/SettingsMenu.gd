extends Control

enum CHANGE_STATE{
  none,
  without_save,
  with_save
}

var current_change = CHANGE_STATE.none

func _ready():
	get_node("Transitioner").open()
	_load_settings()

func _load_settings():
	var switches = get_tree().get_nodes_in_group("settings_switch")
	for switch in switches:
		switch.is_set = ProjectSettings.get_setting(switch.setting_key)

func _save_settings():
	var switches = get_tree().get_nodes_in_group("settings_switch")
	for switch in switches:
		ProjectSettings.set_setting(switch.setting_key, switch.is_set)
		
		#Special case. To change windows size imediately
		if switch.setting_key == "display/window/size/fullscreen" and switch.is_set:
			OS.window_fullscreen = true
		elif switch.setting_key == "display/window/size/fullscreen" and not switch.is_set:
			OS.window_fullscreen = false
	
	ProjectSettings.save()


func _on_ExitWithoutSave_pressed():
	current_change = CHANGE_STATE.without_save
	get_node("Transitioner").close()


func _on_ExitWithSave_pressed():
	current_change = CHANGE_STATE.with_save
	get_node("Transitioner").close()


func _on_Transitioner_transition_finished():
	if current_change == CHANGE_STATE.without_save:
		get_tree().change_scene_to(load("res://Menus/MainMenu/MainMenu.tscn"))
	
	if current_change == CHANGE_STATE.with_save:
		_save_settings()
		get_tree().change_scene_to(load("res://Menus/MainMenu/MainMenu.tscn"))
