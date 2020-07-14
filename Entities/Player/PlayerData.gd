# Singleton for holding player stats that can be accessed
# by other scenes

extends Node

var health: int = 100
var max_health: int = 100

var fuel: int = 100
var max_fuel: int = 100

var capacity: int = 0
var max_capacity: int = 20

var max_speed: int = 350
var acceleration: int = 15
var thurster_power = 20


var inventory = {
	BlockEnums.MineralTypes.COPPER : 0,
	BlockEnums.MineralTypes.IRON : 0,
	BlockEnums.MineralTypes.DIAMOND : 0
}

func add_mineral(type):
	if type in inventory and capacity < max_capacity:
		inventory[type] += 1
		capacity += 1
