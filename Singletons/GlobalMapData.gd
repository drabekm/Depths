extends Node

const BLOCK_SIZE = 32
const HALF_SIZE = BLOCK_SIZE / 2
const CHUNK_SIZE = 5
const CHUNKS_AREA_SIZE = 2 # How many chunks are spawned in each direction
						   # around the central chunk

var ore_noise = OpenSimplexNoise.new()
var helper_ore_noise = OpenSimplexNoise.new()

func _ready():
	randomize()
	ore_noise.seed = randi()
	randomize()
	helper_ore_noise.seed = randi()
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

func reset():
	deleted_blocks = {}
	randomize()
	ore_noise.seed = randi()
	randomize()
	helper_ore_noise.seed = randi()
