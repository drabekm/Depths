extends StaticBody2D

# Main building block of the game up, pun intended

const material_textures = [preload("res://Entities/Block/Textures/blocks/dirt/dirtt.png"),
				 preload("res://Entities/Block/Textures/blocks/stone/stone.png"),
				 preload("res://Entities/Block/Textures/blocks/dark_stone/darkstone.png"),
				 preload("res://Entities/Block/Textures/indestructable.png")]

# Special case textures
const dirt_top_texture = preload("res://Entities/Block/Textures/blocks/dirt/dirt_top.png")
const stone_dirt_texture = preload("res://Entities/Block/Textures/blocks/stone/stone_dirt_top.png")
const dark_stone_top_texture = preload("res://Entities/Block/Textures/blocks/dark_stone/darkstone_top.png")


const mineral_textures =  [preload("res://Entities/Block/Textures/copper.png"),
						 preload("res://Entities/Block/Textures/iron.png"),
						 preload("res://Entities/Block/Textures/gold.png"),
						 preload("res://Entities/Block/Textures/platinum.png"),
						 preload("res://Entities/Block/Textures/diamonds.png")]

const mineral_scores = [20, 50, 100, 200, 500]

const liquid_scene = preload("res://Entities/Liquids/Liquid.tscn")

var material_type: int = 0
var has_mineral: bool = false
var mineral_type: int = -1
var indestructable: bool = false

var chunk_name: String = "" #chunk name is composed of chunks x and y coordinate
var chunk_index: Vector2

const BASE_SCORE = 5
var score: int = BASE_SCORE

var helper_global_position: Vector2

# destroy is to be called only be the player node. 
# If you call this in a chunk destructor or anywhere else
# the globalmapData thing would make chunk empty next time it would load
func destroy():
	Earthquake.block_deleted(mineral_type)
	GlobalMapData.add_deleted_block(self.position, self.chunk_name)
	self.queue_free()


func init(position:Vector2, global_position:Vector2, chunk_name: String, chunk_position: Vector2) -> void:
	self.chunk_name = chunk_name
	self.helper_global_position = global_position
	self.position = position
	self.chunk_index = chunk_position

func set_body(material_type: int):
	
	
	if chunk_index.y == 0 and self.position.y == 0:
		get_node("Body").texture = dirt_top_texture
	elif chunk_index.y == 2 and self.position.y == 0:
		get_node("Body").texture = stone_dirt_texture
	elif chunk_index.y == 4 and self.position.y == 0:
		get_node("Body").texture = dark_stone_top_texture
	else:
		get_node("Body").texture = material_textures[material_type]
#	get_node("Body").texture = material_textures[material_type]
	self.material_type = material_type
	

func set_mineral(mineral_type: int):
	self.mineral_type = mineral_type
	self.has_mineral = true
	self.score = mineral_scores[mineral_type]
	get_node("Mineral").texture = mineral_textures[mineral_type]


func _on_Button_pressed():
	get_tree().change_scene_to(load("res://Menus/MainMenu/MainMenu.tscn"))
