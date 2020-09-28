extends Node

var continue_data_ready: bool = false

var is_in_game: bool = false

var map_deleted_blocks = {}
var map_ore_seed: int = 0
var map_ore_seed_helper: int = 0

func _ready():
	load_data()
	get_tree().set_auto_accept_quit(false)

func load_data():
	if _load_map() and _load_player():
		continue_data_ready = true

func _notification(what):
	if (what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST):
		if is_in_game and not MenuStatus.game_over_opened:
			save_data()
		
		get_tree().quit()

func save_data():
	_save_map()
	_save_player()

func _save_map():
	var data = {}
	data["deleted_blocks"] = GlobalMapData.deleted_blocks
	data["seed"] = GlobalMapData.ore_noise.seed
	data["seed_helper"] = GlobalMapData.helper_ore_noise.seed
	_save_json("map_data", JSON.print(data))

func _save_player():
	var player_file = File.new()
	var data = {}
	data["position"] = PlayerData.position #TODO FINISH
	
	data["health"] = PlayerData.health
	data["max_health"] = PlayerData.max_health
	
	data["fuel"] = PlayerData.fuel
	data["max_fuel"] = PlayerData.max_fuel
	data["fuel_consumption"] = PlayerData.fuel_consumption
	
	data["capacity"] = PlayerData.capacity
	data["max_capacity"] = PlayerData.max_capacity
	
	data["acceleration"] = PlayerData.acceleration
	data["max_speed"] = PlayerData.max_speed
	data["thrust_power"] = PlayerData.thurster_power
	
	data["score"] = PlayerData.score
	data["money"] = PlayerData.money
	data["max_depth"] = PlayerData.max_depth
	
	_save_json("player_data", JSON.print(data))

func _load_map() -> bool:
	var map_file = File.new()
	if map_file.file_exists("user://map_data.save"):
		map_file.open("user://map_data.save", File.READ)
		var map_data_json = map_file.get_as_text()
		var map_data = JSON.parse(map_data_json).result
		
		map_deleted_blocks = map_data["deleted_blocks"]
		map_ore_seed = map_data["seed"]
		map_ore_seed_helper = map_data["seed_helper"]
		return true
	return false

func _load_player() -> bool:
	var player_file = File.new()
	if player_file.file_exists("user://player_data.save"):
		player_file.open("user://player_data.save", File.READ)
		var player_data_json = player_file.get_as_text()
		var player_data = JSON.parse(player_data_json).result
		
		PlayerData.health = player_data["health"]
		PlayerData.max_health = player_data["max_health"] 
		
		PlayerData.fuel = player_data["fuel"] 
		PlayerData.max_fuel = player_data["max_fuel"] 
		PlayerData.fuel_consumption = player_data["fuel_consumption"] 
		
		PlayerData.capacity = player_data["capacity"] 
		PlayerData.max_capacity = player_data["max_capacity"] 
		
		PlayerData.acceleration = player_data["acceleration"] 
		PlayerData.max_speed = player_data["max_speed"] 
		PlayerData.thurster_power = player_data["thrust_power"]
		
		PlayerData.score = player_data["score"] 
		PlayerData.money = player_data["money"] 
		PlayerData.max_depth = player_data["max_depth"]
		PlayerData.position = str2var("Vector2" + player_data["position"])
		return true
	return false

func delete_save_files():
	var dir = Directory.new()
	if (dir.file_exists("user://map_data.save")):
		dir.remove("user://map_data.save")
	
	if (dir.file_exists("user://player_data.save")):
		dir.remove("user://player_data.save")
	
	self.continue_data_ready = false


func _save_json(filename: String, json_str: String):
	var save_file = File.new()
	save_file.open("user://" + filename + ".save", File.WRITE)
	save_file.store_string(json_str)
	save_file.close()
