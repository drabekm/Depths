extends "res://Entities/Shops/BaseShop/BaseShop.gd"

var hull_info
var hull_tank

const PRICE_PER_UNIT = 2

func _ready():
	hull_info = get_node("CanvasLayer/UI/HullTank/HullInfo")
	hull_tank = get_node("CanvasLayer/UI/HullTank")

func _update_hull_info():
	hull_info.text = str(PlayerData.health) + "/" + str(PlayerData.max_health)
	hull_tank.max_value = PlayerData.max_health
	hull_tank.value = PlayerData.health

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
