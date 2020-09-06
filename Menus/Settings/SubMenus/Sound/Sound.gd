extends "res://Menus/Settings/SubMenus/BaseSubSetting/BaseSubSettings.gd"

func _ready():
	_load_settings()

func _load_settings():
	var slider = get_tree().get_nodes_in_group("audio/master")[0]
	var test = ProjectSettings.get_setting("audio/master")
	slider.value = ProjectSettings.get_setting("audio/master")
	
	
	slider = get_tree().get_nodes_in_group("audio/music")[0]
	slider.value = ProjectSettings.get_setting("audio/music")
	
	slider = get_tree().get_nodes_in_group("audio/effects")[0]
	slider.value = ProjectSettings.get_setting("audio/effects")

func _save_settings():
	var slider = get_tree().get_nodes_in_group("audio/master")[0]
	ProjectSettings.set_setting("audio/master", slider.value)
	
	slider = get_tree().get_nodes_in_group("audio/music")[0]
	ProjectSettings.set_setting("audio/music", slider.value)
	
	slider = get_tree().get_nodes_in_group("audio/effects")[0]
	ProjectSettings.set_setting("audio/effects", slider.value)
