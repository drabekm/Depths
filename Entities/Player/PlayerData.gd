# Singleton for holding player stats that can be accessed
# by other scenes

extends Node

var is_alive: bool = true
export var is_imortal: bool = false # for debug

var health: int = 100
var max_health: int = 100

var fuel: float = 30
var max_fuel: int = 30
var fuel_consumption = 0.7

var capacity: int = 0
var max_capacity: int = 20

var max_speed: int = 450 # 350
var acceleration: int = 20 # 15
var thurster_power = 20

var score: int = 0
var money: int = 1000
var max_depth = 0
var position: Vector2 = Vector2(0,0)

var player_name: String = "Testing Name"

signal player_dead

func reset():
	 is_alive = true
	 is_imortal = false 
	
	 health = 100
	 max_health = 100
	
	 fuel = 100
	 max_fuel = 100
	 fuel_consumption = 0.5
	
	 capacity = 0
	 max_capacity = 20
	
	 max_speed = 650 # 350
	 acceleration = 25 # 15
	 thurster_power = 20
	
	 position = Vector2(0,0)
	
	 max_depth = 0
	
	 score = 0
	 money = 1000

var inventory = {
	BlockEnums.MineralTypes.COPPER : 0,
	BlockEnums.MineralTypes.IRON : 0,
	BlockEnums.MineralTypes.GOLD : 0,
	BlockEnums.MineralTypes.PLATINUM : 0,
	BlockEnums.MineralTypes.DIAMOND : 0
}

func _process(delta):
	if not is_alive():
		emit_signal("player_dead")
	
	var depth = floor((PlayerData.position.y) / (GlobalMapData.BLOCK_SIZE * 2)) + 1
	if depth > max_depth:
		max_depth = depth

func remove_fuel(value):
	fuel -= value

func remove_health(value):
	health -= value

func add_mineral(type) -> void:
	if type in inventory and capacity < max_capacity:
		inventory[type] += 1
		capacity += 1

func is_alive() -> bool:
	if not is_imortal:
		is_alive = health > 0 and fuel > 0
	
	return is_alive
