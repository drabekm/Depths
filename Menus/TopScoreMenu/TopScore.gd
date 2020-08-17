extends Control

var score_line = preload("res://Menus/TopScoreMenu/TopScoreLine.tscn")
var score_line_container

var scorePageRequest: HTTPRequest
var pageCountRequest: HTTPRequest

var page: int = 0
var max_page: int = 1

var back_to_menu: bool = false




# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Transitioner").open()
	scorePageRequest = get_node("ScorePageRequest")
	pageCountRequest = get_node("PageCountRequest")	
	
	score_line_container = get_node("MarginContainer/VBoxContainer/ScoreContainer")
	_make_score_request()
	_make_max_page_request()

func _make_max_page_request():
	pageCountRequest.request("http://www.drabas.cz/depths/scorePages.php")

func _make_score_request():
	scorePageRequest.request("http://www.drabas.cz/depths/loadScore.php?page=" + str(page))

func _update_title():
	get_node("MarginContainer/VBoxContainer/Title").text = "Top Score - page: " + str(page + 1)


func _disable_buttons():
	var buttons = get_node("MarginContainer/VBoxContainer/Buttons").get_children()
	for button in buttons:
		button.disabled = true

func _enable_buttons():
	var buttons = get_node("MarginContainer/VBoxContainer/Buttons").get_children()
	for button in buttons:
		button.disabled = false


func _on_btnFirst_pressed():
	if page != 0:
		_disable_buttons()
		page = 0
		_update_title()
		_make_score_request()

func _on_btnPrev_pressed():
	if page > 0:
		_disable_buttons()
		page -= 1
		_make_score_request()
		_update_title()

func _on_btnNext_pressed():
	# todo: get max page count
	if page < max_page - 1:
		_disable_buttons()
		page += 1
		_make_score_request()
		_update_title()

func _on_btnLast_pressed():
	if page != max_page - 1:
		page = max_page - 1
		_disable_buttons()
		_make_score_request()
		_update_title()

func _on_btnExit_pressed():
	back_to_menu = true
	get_node("Transitioner").close()


func _on_ScorePageRequest_request_completed(http_result, response_code, headers, body):
	var old_score_lines = score_line_container.get_children()
	for old_score_line in old_score_lines:
		old_score_line.queue_free()
	
	body = body.get_string_from_utf8()
	if body != "No record":
		var results = JSON.parse(body).result
		for result_item in results:
			var score = result_item["ScoreValue"]
			var name = result_item["ScorePlayerName"]
			var score_line_instance = score_line.instance()
			score_line_instance.set_data(name, score, 0, 123)
			score_line_container.add_child(score_line_instance)
	
	
	_enable_buttons()


func _on_PageCountRequest_request_completed(http_result, response_code, headers, body):
	body = body.get_string_from_utf8()
	if body != "error":
		max_page = int(body)


func _on_Transitioner_transition_finished():
	if back_to_menu:
		get_tree().change_scene_to(load("res://Menus/MainMenu/MainMenu.tscn"))
