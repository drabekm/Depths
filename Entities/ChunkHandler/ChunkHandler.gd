extends Node2D

var chunk = preload("res://Entities/ChunkHandler/Chunk.tscn")

var chunk_containers_node
var central_chunk: Vector2 = Vector2(0,0)

var deleted_blocks = {}

func _ready():
	chunk_containers_node = get_node("ChunkContainers")
	
	check_chunks()

#Is called every time the triggers are hit.
#Removes distant chunks and spawns in new chunks around player
func check_chunks():
	var current_chunks = chunk_containers_node.get_children()
	
	var left_threshold = central_chunk.x - GlobalMapData.CHUNKS_AREA_SIZE
	var right_threshold = central_chunk.x + GlobalMapData.CHUNKS_AREA_SIZE
	var up_threshold = central_chunk.y - GlobalMapData.CHUNKS_AREA_SIZE
	var bottom_threshold = central_chunk.y + GlobalMapData.CHUNKS_AREA_SIZE
	
	#Remove distant chunks
	for current_chunk in current_chunks:
		if (current_chunk.indexX > right_threshold or 
			current_chunk.indexX < left_threshold or
			current_chunk.indexY < up_threshold or
			current_chunk.indexY > bottom_threshold):
			despawn_chunk(current_chunk.indexX, current_chunk.indexY)
	
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
	chunkContainer.indexX = xChunkPos
	chunkContainer.indexY = yChunkPos
	chunkContainer.spawn_blocks()
	
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
		trigger.position.x += GlobalMapData.CHUNK_SIZE * GlobalMapData.BLOCK_SIZE * direction * 2

func _move_triggers_vertically(direction: int):
	var triggers = get_node("Triggers").get_children()
	
	for trigger in triggers:
		trigger.position.y += GlobalMapData.CHUNK_SIZE * GlobalMapData.BLOCK_SIZE * direction * 2


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
