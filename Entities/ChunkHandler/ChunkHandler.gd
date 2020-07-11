extends Node2D

var block = preload("res://Entities/Block/Block.tscn")

const BLOCK_SIZE = 32
const HALF_SIZE = BLOCK_SIZE / 2
const CHUNK_SIZE = 16

var central_chunk: Vector2 = Vector2(0,0)

const material_textures = [preload("res://Entities/Block/Textures/dirt.png"),
				 preload("res://Entities/Block/Textures/stone.png"),
				 preload("res://Entities/Block/Textures/strong_stone.png"),
				 preload("res://Entities/Block/Textures/indestructable.png")]

const mineral_textures =  [preload("res://Entities/Block/Textures/copper.png"),
						 preload("res://Entities/Block/Textures/iron.png"),
						 preload("res://Entities/Block/Textures/diamonds.png")]

func _ready():
	spawn_chunks()


func spawn_chunks():
	spawn_chunk(central_chunk.x, central_chunk.y) # central
	spawn_chunk(central_chunk.x - 1, central_chunk.y) # left
	spawn_chunk(central_chunk.x + 1, central_chunk.y) # right
	
	spawn_chunk(central_chunk.x, central_chunk.y + 1) # central bottom
	spawn_chunk(central_chunk.x - 1, central_chunk.y + 1) # right bottom
	spawn_chunk(central_chunk.x + 1, central_chunk.y + 1) # left bottom

func spawn_chunk(var xChunkPos, var yChunkPos):
	var chunkContainer = Node2D.new()
	chunkContainer.name = _craftNodeName(xChunkPos, yChunkPos)
	
	for y in range(yChunkPos * CHUNK_SIZE, (yChunkPos * CHUNK_SIZE) + CHUNK_SIZE):
		for x in range(xChunkPos * CHUNK_SIZE, (xChunkPos * CHUNK_SIZE) + CHUNK_SIZE):
			var block_instance = block.instance()
			var position = Vector2((BLOCK_SIZE *2) * x, (BLOCK_SIZE * 2) * y)
			block_instance.init(position, 0, false, 0)
			block_instance.set_body_texture(material_textures[int(xChunkPos) % 4]) # TODO Set texture from noise seed
			block_instance.name = _craftNodeName(x,y)
			
			#this is the same as:
			#chunkContainer.add_child(block_instance)
			chunkContainer.call_deferred("add_child", block_instance)
			#But call_deferred calls the method a bit later instead of
			#imediatelly. How does it improve performance?
			#Fuck if I know, but it somehow works.
	
	self.add_child(chunkContainer)

func despawn_chunk(var xChunkPos: int, var yChunkPos: int) -> void:
	var chunk = get_node(_craftNodeName(xChunkPos, yChunkPos))
	if chunk != null:
		chunk.queue_free()

func _craftNodeName(var x: int, var y: int) -> String:
	return str(x) + "," + str(y)

func _is_body_player(body) -> bool:
	return body.is_in_group("Player")

func _move_triggers_horizontaly(direction: int):
	var triggers = get_node("Triggers").get_children()
	
	for trigger in triggers:
		trigger.position.x += CHUNK_SIZE * BLOCK_SIZE * direction * 2

func _move_triggers_vertically(direction: int):
	var triggers = get_node("Triggers").get_children()
	
	for trigger in triggers:
		trigger.position.y += CHUNK_SIZE * BLOCK_SIZE * direction

func _on_LeftTrigger_body_entered(body):
	if(_is_body_player(body)):
		despawn_chunk(central_chunk.x + 1, central_chunk.y)
		despawn_chunk(central_chunk.x + 1, central_chunk.y - 1)
		despawn_chunk(central_chunk.x + 1, central_chunk.y + 1)
		central_chunk.x -= 1
		spawn_chunk(central_chunk.x - 1, central_chunk.y)
		if(central_chunk.y > 1):
			spawn_chunk(central_chunk.x - 1, central_chunk.y - 1)
		spawn_chunk(central_chunk.x - 1, central_chunk.y + 1)
		_move_triggers_horizontaly(-1)
		print(central_chunk)

func _on_RightTrigger_body_entered(body):
	if(_is_body_player(body)):
		despawn_chunk(central_chunk.x - 1, central_chunk.y)
		despawn_chunk(central_chunk.x - 1, central_chunk.y - 1)
		despawn_chunk(central_chunk.x - 1, central_chunk.y + 1)
		central_chunk.x += 1
		spawn_chunk(central_chunk.x + 1, central_chunk.y)
		if(central_chunk.y > 1):
			spawn_chunk(central_chunk.x + 1, central_chunk.y - 1)
		spawn_chunk(central_chunk.x + 1, central_chunk.y + 1)
		_move_triggers_horizontaly(1)
		print(central_chunk)

func _on_TopTrigger_body_entered(body):
	if(_is_body_player(body)):
		despawn_chunk(central_chunk.x, central_chunk.y + 1)
		despawn_chunk(central_chunk.x - 1, central_chunk.y + 1)
		despawn_chunk(central_chunk.x + 1, central_chunk.y + 1)
		central_chunk.y -= 1
		
		if(central_chunk.y > 0):
			spawn_chunk(central_chunk.x, central_chunk.y - 1)
			spawn_chunk(central_chunk.x - 1, central_chunk.y - 1)
			spawn_chunk(central_chunk.x + 1, central_chunk.y - 1)
		_move_triggers_vertically(-1)
		print(central_chunk)

func _on_BottomTrigger_body_entered(body):
	if(_is_body_player(body)):
		despawn_chunk(central_chunk.x, central_chunk.y - 1)
		despawn_chunk(central_chunk.x - 1, central_chunk.y - 1)
		despawn_chunk(central_chunk.x + 1, central_chunk.y - 1)
		central_chunk.y += 1
		if(central_chunk.y >= -1):
			spawn_chunk(central_chunk.x, central_chunk.y + 1)
			spawn_chunk(central_chunk.x - 1, central_chunk.y + 1)
			spawn_chunk(central_chunk.x + 1, central_chunk.y + 1)
		_move_triggers_vertically(1)
		print(central_chunk)
