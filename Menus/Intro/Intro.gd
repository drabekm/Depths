extends Control

var next_scene
var change_scene: bool = false
var first_load: bool = true
var fuck: bool = false # yeah, I don't give a shit anymore, I have to finish this game before the deadline lol

func _ready():
	if (ProjectSettings.get_setting("application/config/firststart")):
		next_scene = load("res://Menus/FirstStart/FirstStart.tscn")
	else:
		next_scene = load("res://Menus/MainMenu/MainMenu.tscn")
	$Transitioner.open()

func _on_Transitioner_transition_finished():
	if change_scene:
		get_tree().change_scene_to(next_scene)
	
	if not first_load and not fuck:
		$Transitioner.open()
		$English.visible = false
		$CzechTimer.start()
		fuck = true

func _on_EnglishTimer_timeout():
	$Transitioner.close()
	first_load = false


func _on_CzechTimer_timeout():
	change_scene = true
	$Transitioner.close()
