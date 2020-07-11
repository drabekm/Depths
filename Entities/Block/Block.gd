extends StaticBody2D

export var material_type: int = 0
export var has_mineral: bool = false
export var mineral_type: int = -1
var indestructable: bool = false

func init(position:Vector2, material_type: int, has_mineral: bool, mineral_type: int = -1) -> void:
	self.position = position
	self.material_type = material_type
	self.has_mineral = has_mineral
	self.mineral_type = mineral_type

func set_body_texture(texture: Texture):
	get_node("Body").texture = texture

func set_mineral_texture(texture: Texture):
	get_node("Mineral").texture = texture
