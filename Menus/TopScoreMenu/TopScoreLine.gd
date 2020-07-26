extends HBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_data(player_name, player_score, player_depth, player_time):
	get_node("Name").text = str(player_name)
	get_node("Score").text = str(player_score)
	get_node("MaxDepth").text = str(player_depth)
	get_node("Time").text = str(player_time)
