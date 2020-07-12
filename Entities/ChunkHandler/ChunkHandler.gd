extends Node2D

var block = preload("res://Entities/Block/Block.tscn")
var chunk = preload("res://Entities/ChunkHandler/Chunk.tscn")

const BLOCK_SIZE = 32
const HALF_SIZE = BLOCK_SIZE / 2
const CHUNK_SIZE = 5 #
const CHUNKS_AREA_SIZE = 2 # How many chunks are spawned in each direction
						   # around the central chunk

var chunk_containers_node

var central_chunk: Vector2 = Vector2(0,0)

const material_textures = [preload("res://Entities/Block/Textures/dirt.png"),
				 preload("res://Entities/Block/Textures/stone.png"),
				 preload("res://Entities/Block/Textures/strong_stone.png"),
				 preload("res://Entities/Block/Textures/indestructable.png")]

const mineral_textures =  [preload("res://Entities/Block/Textures/copper.png"),
						 preload("res://Entities/Block/Textures/iron.png"),
						 preload("res://Entities/Block/Textures/diamonds.png")]

func _ready():
	chunk_containers_node = get_node("ChunkContainers")
	
	check_chunks()

#Is called every time the triggers are hit.
#Removes distant chunks and spawns in new chunks around player
func check_chunks():
	var current_chunks = chunk_containers_node.get_children()
	
	var left_threshold = central_chunk.x - CHUNKS_AREA_SIZE
	var right_threshold = central_chunk.x + CHUNKS_AREA_SIZE
	var up_threshold = central_chunk.y - CHUNKS_AREA_SIZE
	var bottom_threshold = central_chunk.y + CHUNKS_AREA_SIZE
	
	#Remove distant chunks
	for current_chunk in current_chunks:
		if (current_chunk.positionX > right_threshold or 
			current_chunk.positionX < left_threshold or
			current_chunk.positionY < up_threshold or
			current_chunk.positionY > bottom_threshold):
			despawn_chunk(current_chunk.positionX, current_chunk.positionY)
	
	#Spawn new chunks
	for y in range(up_threshold, bottom_threshold + 1):
		for x in range(left_threshold, right_threshold + 1):
			var chunk_name = _craftNodeName(x,y)
			#Don't spawn already existing chunks
			if not chunk_containers_node.has_node(chunk_name):
				spawn_chunk(x,y)

func spawn_chunk(var xChunkPos, var yChunkPos):
	#Chunks can't exist above ground level
	if yChunkPos < 0:
		return
	
	var chunkContainer = chunk.instance()
	chunkContainer.name = _craftNodeName(xChunkPos, yChunkPos)
	chunkContainer.positionX = xChunkPos
	chunkContainer.positionY = yChunkPos
	
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
	
	chunk_containers_node.add_child(chunkContainer)

func despawn_chunk(var xChunkPos: int, var yChunkPos: int) -> void:
	var chunk_name = _craftNodeName(xChunkPos, yChunkPos)
	if chunk_containers_node.has_node(chunk_name):
		chunk_containers_node.get_node(chunk_name).queue_free()

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


# Trigger signal handler method
func _on_LeftTrigger_body_entered(body):
	if(_is_body_player(body)):
		central_chunk.x -= 1
		check_chunks()
		_move_triggers_horizontaly(-1)

func _on_RightTrigger_body_entered(body):
	if(_is_body_player(body)):
		central_chunk.x += 1
		check_chunks()
		_move_triggers_horizontaly(1)

func _on_TopTrigger_body_entered(body):
	if(_is_body_player(body)):
		central_chunk.y -= 1
		check_chunks()
		_move_triggers_vertically(-1)

func _on_BottomTrigger_body_entered(body):
	if(_is_body_player(body)):
		central_chunk.y += 1
		check_chunks()
		_move_triggers_vertically(1)
