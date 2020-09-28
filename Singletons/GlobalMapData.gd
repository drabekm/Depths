extends Node

const BLOCK_SIZE = 32
const HALF_SIZE = BLOCK_SIZE / 2
const CHUNK_SIZE = 5
const CHUNKS_AREA_SIZE = 3 # How many chunks are spawned in each direction
						   # around the central chunk

var ore_noise = OpenSimplexNoise.new()
var helper_ore_noise = OpenSimplexNoise.new()

func _ready():
	
	if MenuStatus.is_game_new:
		randomize()
		ore_noise.seed = randi()
		randomize()
		helper_ore_noise.seed = randi()
	else:
		ore_noise.seed = Saver.map_ore_seed
		helper_ore_noise.seed = Saver.map_ore_seed_helper
		
		if Saver.map_deleted_blocks != {}:
			deleted_blocks = Saver.map_deleted_blocks

	ore_noise.octaves = 4
	helper_ore_noise.octaves = 5
	ore_noise.period = 0.1
	helper_ore_noise.period = 0.5
	ore_noise.persistence = 0.0
	helper_ore_noise.persistence = 0.0
	ore_noise.lacunarity = 2
	helper_ore_noise.lacunarity = 2

#Used by chunks to assing minerals to ores
#Needs some more work tho
func get_noise_value(x: float, y: float) -> float:
	return ore_noise.get_noise_2d(x,y)

func get_helper_noise_value(x: float, y:float) -> float:
	return helper_ore_noise.get_noise_2d(x,y)

var deleted_blocks = {} # all deleted blocks in chunks
# it's stored as a dictionary of chunk name -> deleted blocks array
var restored_blocks = {} # blocks that were drilled out
# but restored wit lava

func restore_blocks():
	var chunk_handler = get_tree().get_nodes_in_group("chunk_handler")[0]
	for x in range(-5, 5):
		for y in range(1, PlayerData.max_depth):
			var chunk_key = str(x) + "," + str(y)
			if not restored_blocks.has(chunk_key):
				if deleted_blocks.has(chunk_key):
					restored_blocks[chunk_key] = deleted_blocks[chunk_key]
			else:
				if restored_blocks.has(chunk_key) and deleted_blocks.has(chunk_key):
					var restored_blocks_array = restored_blocks[chunk_key]
					var deleted_blocks_array = deleted_blocks[chunk_key]
					for deleted_block in deleted_blocks_array:
						if not restored_blocks_array.has(deleted_block):
							restored_blocks_array.append(deleted_block)
					restored_blocks[chunk_key] = restored_blocks_array
			deleted_blocks.erase(chunk_key)
			chunk_handler.refresh_chunk(chunk_key)

func add_deleted_block(block_position: Vector2, chunk_name: String):
	if chunk_name in deleted_blocks:
		deleted_blocks[chunk_name].append(block_position)
	else:
		deleted_blocks[chunk_name] = [block_position]

func get_deleted_blocks(chunk_name: String):
	if deleted_blocks.has(chunk_name):
		return deleted_blocks.get(chunk_name)
	return []

func get_restored_blocks(chunk_name: String):
	if restored_blocks.has(chunk_name):
		return restored_blocks.get(chunk_name)
	return []

func reset():
	deleted_blocks = {}
	randomize()
	ore_noise.seed = randi()
	randomize()
	helper_ore_noise.seed = randi()
