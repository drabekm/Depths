extends Control


var menu_scene = load("res://Menus/Settings/SettingsMenu.tscn")
var transitioner
var is_exit: bool = false

func _ready():
	transitioner = get_node("Transitioner")
	_translate_labels_and_buttons()
	_load_settings()

func _translate_labels_and_buttons():
	var nodes = get_tree().get_nodes_in_group("translate")
	for node in nodes:
		if node is Label or node is Button:
			node.text = Translator.translate(node.text)


func _load_settings():
	pass

func _save_settings():
	pass

func _on_btnApply_pressed():
	$ButtonPressedAudio.play()
	_save_settings()


func _on_btnSave_pressed():
	$ButtonPressedAudio.play()
	_save_settings()
	is_exit = true
	transitioner.close()


func _on_btnNoSave_pressed():
	$ButtonPressedAudio.play()
	is_exit = true
	transitioner.close()


func _on_Transitioner_transition_finished():
	if is_exit:
		get_tree().change_scene_to(menu_scene)
