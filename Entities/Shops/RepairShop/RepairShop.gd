extends "res://Entities/Shops/BaseShop/BaseShop.gd"

var hull_info
var hull_tank
var money

const PRICE_PER_UNIT = 2

func _ready():
	hull_info = get_node("CanvasLayer/UI/HullTank/HullInfo")
	hull_tank = get_node("CanvasLayer/UI/HullTank")
	money = get_node("CanvasLayer/UI/HullTank/Money/Value")
	_translate_labels_and_buttons()

func _update_hull_info():
	hull_info.text = str(PlayerData.health) + "/" + str(PlayerData.max_health)
	hull_tank.max_value = PlayerData.max_health
	hull_tank.value = PlayerData.health
	money.text = PlayerData.money

func _translate_labels_and_buttons():
	var nodes = get_tree().get_nodes_in_group("translate")
	for node in nodes:
		if node is Label or node is Button:
			node.text = Translator.translate(node.text)
			print(node.text)

func _player_entered():
	get_node("Building").play("player_enter")

func _player_left():
	get_node("Building").play("player_leave")

func _open_shop():
	._open_shop()
	_update_hull_info()

func _on_btnRepair_pressed():
	for i in range(PlayerData.max_health - floor(PlayerData.health)):
		if PlayerData.money >= PRICE_PER_UNIT:
			PlayerData.health = floor(PlayerData.health)
			PlayerData.health += 1
			PlayerData.money -= 2
		else:
			break
	_update_hull_info()


func _on_Exit_pressed():
	._close_shop()


func _on_Building_animation_finished():
	if get_node("Building").animation == "player_leave":
		get_node("Building").play("idle")


func _on_Button20_pressed():
	if PlayerData.money >= PRICE_PER_UNIT * 20:
		PlayerData.health = floor(PlayerData.health)
		PlayerData.health += 20
		PlayerData.money -= PRICE_PER_UNIT * 20
		_update_hull_info()


func _on_Button5_pressed():
	if PlayerData.money >= PRICE_PER_UNIT * 5:
		PlayerData.health = floor(PlayerData.health)
		PlayerData.health += 5
		PlayerData.money -= PRICE_PER_UNIT * 5
		_update_hull_info()


func _on_Button1_pressed():
	if PlayerData.money >= PRICE_PER_UNIT:
		PlayerData.health = floor(PlayerData.health)
		PlayerData.health += 1
		PlayerData.money -= PRICE_PER_UNIT
		_update_hull_info()
