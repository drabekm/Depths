extends Control

enum CHANGE_STATE{
  none,
  graphics,
  sound,
  other,
  menu
}

var current_change = CHANGE_STATE.none

var main_menu_scene 
var graphics_scene
var sound_scene
var other_scene

func _ready():
	_translate_labels_and_buttons()
	main_menu_scene = load("res://Menus/MainMenu/MainMenu.tscn")
	graphics_scene = preload("res://Menus/Settings/SubMenus/Graphics/Graphics.tscn")
	sound_scene = preload("res://Menus/Settings/SubMenus/Sound/Sound.tscn")
	other_scene = preload("res://Menus/Settings/SubMenus/Other/Other.tscn")
	get_node("Transitioner").open()
	

func _translate_labels_and_buttons():
	var nodes = get_tree().get_nodes_in_group("translate")
	for node in nodes:
		if node is Label or node is Button:
			node.text = Translator.translate(node.text)
			print(node.text)

func _on_Transitioner_transition_finished():
	if current_change == CHANGE_STATE.menu:
		get_tree().change_scene_to(main_menu_scene)
	
	if current_change == CHANGE_STATE.graphics:
		get_tree().change_scene_to(graphics_scene)
	
	if current_change == CHANGE_STATE.sound:
		get_tree().change_scene_to(sound_scene)
	
	if current_change == CHANGE_STATE.other:
		get_tree().change_scene_to(other_scene)


func _on_btnGraphics_pressed():
	$ButtonPressedAudio.play()
	current_change = CHANGE_STATE.graphics
	get_node("Transitioner").close()


func _on_btnSound_pressed():
	$ButtonPressedAudio.play()
	current_change = CHANGE_STATE.sound
	get_node("Transitioner").close()


func _on_btnOther_pressed():
	$ButtonPressedAudio.play()
	current_change = CHANGE_STATE.other
	get_node("Transitioner").close()


func _on_ExitWithSave_pressed():
	$ButtonPressedAudio.play()
	current_change = CHANGE_STATE.menu
	get_node("Transitioner").close()
