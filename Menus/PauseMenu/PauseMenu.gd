extends Control

# Menu that pauses

var main_menu = load("res://Menus/MainMenu/MainMenu.tscn")

func _ready():
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("escape") and not (MenuStatus.inventory_opened or MenuStatus.shop_opened or MenuStatus.game_over_opened):
		if self.visible:
			hide()
		else:
			show()

func show():
	MenuStatus.pause_menu_opened = true
	get_tree().paused = true
	self.visible = true

func hide():
	MenuStatus.pause_menu_opened = false
	get_tree().paused = false
	self.visible = false


func _on_Continue_pressed():
	$ButtonPressedAudio.play()
	hide()


func _on_Settings_pressed():
	# todo: open settings
	$ButtonPressedAudio.play()
	pass


func _on_Exit_pressed():
	$ButtonPressedAudio.play()
	get_tree().paused = false
	MenuStatus.pause_menu_opened = false
	Saver.is_in_game = false
	Saver.save_data()
	get_tree().change_scene_to(main_menu)
