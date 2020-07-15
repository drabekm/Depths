extends Node2D

var is_player_near: bool = false

var player_node: Node
var button_marker: Node
var y_offset: int = 50 # how much is the marker moved up
var shop_oppened: bool = false

const PRICE_PER_UNIT = 2

var fuel_info
var fuel_tank

func _ready():
	set_process(false)
	set_process_input(false)
	button_marker = get_node("ButtonMarker")
	fuel_tank = get_node("CanvasLayer/UI/FuelTank")
	fuel_info = get_node("CanvasLayer/UI/FuelTank/FuelInfo")

func _process(delta):
	
	if player_node.is_on_floor(): # show button market
		button_marker.visible = true
		var new_position = player_node.global_position
		new_position.y -= y_offset
		button_marker.global_position = new_position
	else:
		button_marker.visible = false
		pass

func _input(event):
	if event.is_action_pressed("function"):
		if !shop_oppened:
			_open_shop()
		elif shop_oppened:
			_close_shop()
	
	if event.is_action_pressed("escape") and shop_oppened:
		_close_shop()

func _open_shop():
	get_tree().paused = true
	shop_oppened = true
	_update_fuel_info()
	get_node("CanvasLayer/UI").visible = true

func _update_fuel_info():
	fuel_info.text = str(PlayerData.fuel) + "/" + str(PlayerData.max_fuel)
	fuel_tank.max_value = PlayerData.max_fuel
	fuel_tank.value = PlayerData.fuel

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


func _on_ButtonExit_pressed():
	_close_shop()


func _on_ButtonFill_pressed():
	PlayerData.fuel = floor(PlayerData.fuel)
	for i in range(PlayerData.max_fuel - PlayerData.fuel):
		if PlayerData.money > PRICE_PER_UNIT:
			PlayerData.fuel += 1
			PlayerData.money -= 2
		else:
			break
	
	_update_fuel_info()
