tool
extends HBoxContainer

#export var text: String setget text_changed 
export var setting_key: String
export var is_set: bool setget set_changed

func set_changed(value):
	if value == true:
		get_node("btnYes").pressed = true
		get_node("btnNo").pressed = false
	else:
		get_node("btnYes").pressed = false
		get_node("btnNo").pressed = true
	
	is_set = value

func _on_btnYes_pressed():
	if not is_set:
		is_set = true
		get_node("btnNo").pressed = false
	else:
		get_node("btnYes").pressed = true

func _on_btnNo_pressed():
	if is_set:
		is_set = false
		get_node("btnYes").pressed = false
	else:
		get_node("btnNo").pressed = true
