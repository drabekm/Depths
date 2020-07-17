extends Control

# Menu that pauses

var main_menu = preload("res://Menus/MainMenu/MainMenu.tscn")

func _ready():
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("escape"):
		if self.visible:
			hide()
		else:
			show()

func show():
	get_tree().paused = true
	self.visible = true

func hide():
	get_tree().paused = false
	self.visible = false


func _on_Continue_pressed():
	hide()


func _on_Settings_pressed():
	# todo: open settings
	pass


func _on_Exit_pressed():
	get_tree().paused = false
	get_tree().change_scene_to(main_menu)
