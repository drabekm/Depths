# Singleton for holding player stats that can be accessed
# by other scenes

extends Node

var is_alive: bool = true
var is_imortal: bool = false # for debug

var health: int = 100
var max_health: int = 100

var fuel: float = 100
var max_fuel: int = 100
var fuel_consumption = 0.5

var capacity: int = 0
var max_capacity: int = 20

var max_speed: int = 350
var acceleration: int = 15
var thurster_power = 20

var score: int = 0
var money: int = 10

var inventory = {
	BlockEnums.MineralTypes.COPPER : 0,
	BlockEnums.MineralTypes.IRON : 0,
	BlockEnums.MineralTypes.DIAMOND : 0
}

func add_mineral(type) -> void:
	if type in inventory and capacity < max_capacity:
		inventory[type] += 1
		capacity += 1

func check_if_alive() -> bool:
	if not is_imortal:
		is_alive = health > 0 and fuel > 0
	
	return is_alive
