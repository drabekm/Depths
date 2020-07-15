extends StaticBody2D

const material_textures = [preload("res://Entities/Block/Textures/dirt.png"),
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

var chunk_name: String = ""
const BASE_SCORE = 5
var score: int = BASE_SCORE

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
