extends Node

var pause_menu_opened: bool = false
var shop_opened: bool = false
var inventory_opened: bool = false
var game_over_opened: bool = false

var is_game_new: bool = false
var is_game_continue: bool = false

func GameIsNew():
	is_game_new = true
	is_game_continue = false

func GameIsContinue():
	is_game_new = false
	is_game_continue = true
