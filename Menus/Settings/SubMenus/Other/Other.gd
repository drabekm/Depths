extends "res://Menus/Settings/SubMenus/BaseSubSetting/BaseSubSettings.gd"


func _ready():
	pass


func _load_settings():
	var language_value = ProjectSettings.get_setting("application/config/language")
	if language_value == 0:
		var czech_button = get_node("MarginContainer/Rows/ScrollContainer/Options/Language/btnCzech")
		czech_button.pressed = true
	elif language_value == 1:
		var english_button = get_node("MarginContainer/Rows/ScrollContainer/Options/Language/btnEnglish")
		english_button.pressed = true

func _save_settings():
	var czech_button = get_node("MarginContainer/Rows/ScrollContainer/Options/Language/btnCzech")
	var english_button = get_node("MarginContainer/Rows/ScrollContainer/Options/Language/btnEnglish")
	
	if czech_button.pressed:
		ProjectSettings.set_setting("application/config/language", Translator.Language_indexes.CZECH)
		Translator.selected_language = Translator.Language_indexes.CZECH
	elif english_button.pressed:
		ProjectSettings.set_setting("application/config/language", Translator.Language_indexes.ENGLISH)
		Translator.selected_language = Translator.Language_indexes.ENGLISH
	
	var score_server_text = get_node("MarginContainer/Rows/ScrollContainer/Options/ScoreServerWrapper/ScoreServer/Label")
	ProjectSettings.set_setting("application/config/scoreserver", score_server_text)


func _on_btnCzech_pressed():
	get_node("MarginContainer/Rows/ScrollContainer/Options/Language/btnEnglish").pressed = false


func _on_btnEnglish_pressed():
	get_node("MarginContainer/Rows/ScrollContainer/Options/Language/btnCzech").pressed = false
