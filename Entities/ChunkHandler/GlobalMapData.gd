extends Node

var deleted_blocks = {}

func add_deleted_block(block_position: Vector2, chunk_name: String):
	if chunk_name in deleted_blocks:
		deleted_blocks[chunk_name].append(block_position)
	else:
		deleted_blocks[chunk_name] = [block_position]

func get_deleted_blocks(chunk_name: String):
	if chunk_name in deleted_blocks:
		var test = deleted_blocks.get(chunk_name)
		return deleted_blocks.get(chunk_name)
	return []
