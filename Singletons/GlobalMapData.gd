extends Node

const BLOCK_SIZE = 32
const HALF_SIZE = BLOCK_SIZE / 2
const CHUNK_SIZE = 5
const CHUNKS_AREA_SIZE = 2 # How many chunks are spawned in each direction
						   # around the central chunk

var noise = OpenSimplexNoise.new()
var noise2 = OpenSimplexNoise.new()

func _ready():
	randomize()
	noise.seed = randi()
	noise2.seed = randi()
	noise.octaves = 4
	noise2.octaves = 5
	noise.period = 64.0
	noise2.period = 64.0
	noise.persistence = 0.5
	noise2.persistence = 0.5
	noise.lacunarity = 2
	noise2.lacunarity = 2

#Used by chunks to assing minerals to ores
#Needs some more work tho
func get_noise_value(x: float, y: float) -> float:
	#print(str(noise.get_noise_2d(x,y) / abs(noise2.get_noise_3d(x,y, sqrt(x + y)))))
	return noise.get_noise_2d(x,y)

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
