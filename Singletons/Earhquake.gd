extends Node


var block_values = [10, 20, 40]
const value_per_time_added = 0.5
var earthquake_treshold = 350
var current_value = 0
var is_in_game: bool = false

signal earthquake_triggered

func _ready():
	pass # Replace with function body.

func reset():
	current_value = 0

func game_start():
	is_in_game = true

func game_end():
	is_in_game = false

func block_deleted(var block_type):
	if block_type != -1:
		current_value += block_values[block_type]
	else:
		current_value += 2
	print ("Earthquake: " + str(current_value))
	check_if_treshold_reached()

func check_if_treshold_reached():
	if current_value >= earthquake_treshold:
		emit_signal("earthquake_triggered")

func _on_PlayerUndergroundTimer_timeout():
	if is_in_game:
		if PlayerData.position.y > GlobalMapData.BLOCK_SIZE * 2 * GlobalMapData.CHUNK_SIZE:
			current_value += value_per_time_added
			print ("Earthquake: " + str(current_value))
			check_if_treshold_reached()
