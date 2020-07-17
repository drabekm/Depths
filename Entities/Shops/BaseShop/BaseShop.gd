extends Node2D

#This is a base node for other shops to inherit from.



var is_player_near: bool = false

var player_node

var button_marker # button marker is supposed to indicate that a player can
#enter a shop by displaying a function button above players node

var y_offset: int = 50 # how much is the marker moved above player
var shop_oppened: bool = false



func _ready():
	set_process(false)
	set_process_input(false)
	
	pause_mode = Node.PAUSE_MODE_PROCESS # This has to be hard coded
	# Otherwise pause_mode stays in inherit when player opens the store
	# and won't be able to leave
	# Why? Fuck if I know
	
	button_marker = get_node("ButtonMarker")
	_on_ready()


func _on_ready():
	pass

func _process(delta):
	if player_node != null:
		if player_node.is_on_floor(): # show button market 
			button_marker.visible = true
			var new_position = player_node.global_position
			new_position.y -= y_offset
			button_marker.global_position = new_position
		else:
			button_marker.visible = false

func _input(event):
	if event.is_action_pressed("function") and is_player_near and player_node.is_on_floor():
		if !shop_oppened:
			_open_shop()
		elif shop_oppened:
			_close_shop()
	
	if event.is_action_pressed("escape") and shop_oppened:
		_close_shop()

func _open_shop():
	get_tree().paused = true
	shop_oppened = true
	get_node("CanvasLayer/UI").visible = true

func _close_shop():
	get_tree().paused = false
	shop_oppened = false
	get_node("CanvasLayer/UI").visible = false

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		is_player_near = true
		player_node = body
		button_marker.visible = true
		set_process(true)
		set_process_input(true)

func _on_Area2D_body_exited(body):
	if body.is_in_group("Player"):
		is_player_near = false
		player_node = null
		button_marker.visible = false
		set_process(false)
		set_process_input(true)


