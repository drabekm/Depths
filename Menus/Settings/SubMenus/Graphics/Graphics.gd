extends "res://Menus/Settings/SubMenus/BaseSubSetting/BaseSubSettings.gd"


func _ready():
	
	pass

func _load_settings():
	var switches = get_tree().get_nodes_in_group("settings_switch")
	for switch in switches:
		switch.is_set = ProjectSettings.get_setting(switch.setting_key)

func _save_settings():
	var settings_switches = get_tree().get_nodes_in_group("settings_switch")
	for switch in settings_switches:
		if not switch.is_in_group("non_engine_settings"):
			ProjectSettings.set_setting(switch.setting_key, switch.is_set)
			
			#Special case. To change windows size imediately
			if switch.setting_key == "display/window/size/fullscreen" and switch.is_set:
				OS.window_fullscreen = true
			elif switch.setting_key == "display/window/size/fullscreen" and not switch.is_set:
				OS.window_fullscreen = false
	
	ProjectSettings.save()
