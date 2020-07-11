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
