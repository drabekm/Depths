extends StaticBody2D

# Main building block of the game up, pun intended

const material_textures = [preload("res://Entities/Block/Textures/blocks/dirt/dirtt.png"),
				 preload("res://Entities/Block/Textures/stone.png"),
				 preload("res://Entities/Block/Textures/strong_stone.png"),
				 preload("res://Entities/Block/Textures/indestructable.png")]

const mineral_textures =  [preload("res://Entities/Block/Textures/copper.png"),
						 preload("res://Entities/Block/Textures/iron.png"),
						 preload("res://Entities/Block/Textures/diamonds.png")]

const mineral_scores = [50, 100, 1000]

var material_type: int = 0
var has_mineral: bool = false
var mineral_type: int = -1
var indestructable: bool = false

var chunk_name: String = "" #chunk name is composed of chunks x and y coordinate

const BASE_SCORE = 5
var score: int = BASE_SCORE

# destroy is to be called only be the player node. 
# If you call this in a chunk destructor or anywhere else
# the globalmapData thing would make chunk empty next time it would load
func destroy():
	GlobalMapData.add_deleted_block(self.position, self.chunk_name)
	self.queue_free()


func init(position:Vector2, chunk_name: String) -> void:
	self.chunk_name = chunk_name
	self.position = position

func set_body(material_type: int):
	self.material_type = material_type
	get_node("Body").texture = material_textures[material_type]

func set_mineral(mineral_type: int):
	self.mineral_type = mineral_type
	self.has_mineral = true
	self.score = mineral_scores[mineral_type]
	get_node("Mineral").texture = mineral_textures[mineral_type]


func _on_Button_pressed():
	get_tree().change_scene_to(load("res://Menus/MainMenu/MainMenu.tscn"))
