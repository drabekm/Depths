extends "res://Entities/Shops/BaseShop/BaseShop.gd"

# Shop with fuel, pretty simple

var fuel_info
var fuel_tank

const PRICE_PER_UNIT = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	fuel_tank = get_node("CanvasLayer/UI/FuelTank")
	fuel_info = get_node("CanvasLayer/UI/FuelTank/FuelInfo")

func _update_fuel_info():
	fuel_info.text = str(PlayerData.fuel) + "/" + str(PlayerData.max_fuel)
	fuel_tank.max_value = PlayerData.max_fuel
	fuel_tank.value = PlayerData.fuel

func _open_shop():
	._open_shop()
	_update_fuel_info()

func _on_ButtonExit_pressed():
	._close_shop()


func _on_ButtonFillTank_pressed():
	for i in range(PlayerData.max_fuel - floor(PlayerData.fuel)):
		if PlayerData.money >= PRICE_PER_UNIT:
			PlayerData.fuel = floor(PlayerData.fuel)
			PlayerData.fuel += 1
			PlayerData.money -= 2
		else:
			break
	_update_fuel_info()
