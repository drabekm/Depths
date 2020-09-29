extends Control

func _ready():
	PlayerData.connect("player_dead", self, "_on_player_dead")
	get_node("Panel/CenterContainer/VBoxContainer/Score/Value").text = str(PlayerData.score)


func _on_player_dead():
	_show()

func _show():
	get_tree().paused = true
	$Panel/CenterContainer/VBoxContainer/Score/Value.text = PlayerData.score
	$Panel/CenterContainer/VBoxContainer/MaxDepth/Value.text = PlayerData.max_depth
	self.visible = true

func _hide():
	get_tree().paused = false
	self.visible = false


func _on_btnSave_pressed():
	$ButtonPressedAudio.play()
#	get_tree().paused = false
	Earthquake.game_end()
	_make_save_score_request()
	
#	get_tree().change_scene_to(load("res://Menus/TopScoreMenu/TopScore.tscn"))

func _make_save_score_request():
	$HTTPRequest.request("http://www.drabas.cz/depths/saveScore.php?playerName=" + PlayerData.player_name + "&playerScore=" + str(PlayerData.score))


func _on_btnNoSave_pressed():
	$ButtonPressedAudio.play()
	Earthquake.game_end()
	get_node("SkipSaving").show()
#	get_tree().paused = false
#	get_tree().change_scene_to(load("res://Menus/MainMenu/MainMenu.tscn"))


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	body = body.get_string_from_utf8()
	if body == "succes":
		get_tree().paused = false
		Saver.delete_save_files()
		get_tree().change_scene_to(load("res://Menus/TopScoreMenu/TopScore.tscn"))
	else:
		print("fail")
		pass
