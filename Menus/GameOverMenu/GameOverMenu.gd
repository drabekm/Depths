extends Control

func _ready():
	PlayerData.connect("player_dead", self, "_on_player_dead")
	get_node("Panel/CenterContainer/VBoxContainer/Score/Value").text = str(PlayerData.score)


func _on_player_dead():
	_show()

func _show():
	get_tree().paused = true
	self.visible = true

func _hide():
	get_tree().paused = false
	self.visible = false


func _on_btnSave_pressed():
	get_tree().paused = false
	get_tree().change_scene_to(load("res://Menus/TopScoreMenu/TopScore.tscn"))


func _on_btnNoSave_pressed():
	get_tree().paused = false
	get_tree().change_scene_to(load("res://Menus/MainMenu/MainMenu.tscn"))
