extends Control

func _ready():
	pass # Replace with function body.

func show():
	print(get_tree().paused)
	self.visible = true

func _on_btnNo_pressed():
	self.visible = false

func _on_btnYes_pressed():
	get_tree().paused = false
	Saver.delete_save_files()
	get_tree().change_scene_to(load("res://Menus/MainMenu/MainMenu.tscn"))
