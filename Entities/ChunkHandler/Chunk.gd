extends Node2D

# This node serves as a container for blocks and is responsible
# for spawning them in and setting their minerals and stuff.
# Chunk size is determined by chunkHandler node

const block = preload("res://Entities/Block/Block.tscn")

var indexX
var indexY

func spawn_blocks():
	self.position = Vector2(GlobalMapData.BLOCK_SIZE * GlobalMapData.CHUNK_SIZE * indexX * 2, GlobalMapData.BLOCK_SIZE * GlobalMapData.CHUNK_SIZE * indexY * 2)
	
	var deleted_blocks = GlobalMapData.get_deleted_blocks(self.name)
	
	# generate blocks
	for y in range(0, GlobalMapData.CHUNK_SIZE):
		for x in range(0, GlobalMapData.CHUNK_SIZE):
			var block_instance = block.instance()
			var block_position = Vector2((GlobalMapData.BLOCK_SIZE * 2) * x, (GlobalMapData.BLOCK_SIZE * 2) * y)
			
			if deleted_blocks.has(str(block_position)) or deleted_blocks.has(block_position):
				continue
			
			block_instance.init(block_position, self.name)
			
			block_position.y += self.position.y
			block_position.x += self.position.x
			
			if(block_position.y < GlobalMapData.BLOCK_SIZE * 8):
				block_instance.set_body(BlockEnums.MaterialTypes.DIRT)
			elif(block_position.y < GlobalMapData.BLOCK_SIZE * 20):
				block_instance.set_body(BlockEnums.MaterialTypes.STONE)
			else:
				block_instance.set_body(BlockEnums.MaterialTypes.STRONG_STONE)
			
			
#			give_block_mineral(block_instance, block_position.x, block_position.y)
			give_block_mineral(block_instance, indexX * GlobalMapData.CHUNK_SIZE + x * 2, indexY * GlobalMapData.CHUNK_SIZE + y)
			
			
			
			block_instance.name = _craftNodeName(x,y)
			
			#this is the same as:
			#chunkContainer.add_child(block_instance)
			self.call_deferred("add_child", block_instance)
			#But call_deferred calls the method a bit later instead of
			#imediatelly. How does it improve performance?
			#Fuck if I know, but it somehow works.


# the noise function really needs some works before it 
# generates ores in some usable way
func give_block_mineral(var block, posX, posY):
	var noise_value = GlobalMapData.get_noise_value(posX, posY)
	
#	if block.material_type == BlockEnums.MaterialTypes.DIRT:
#		noise_value *= 0.8
#	if block.material_type == BlockEnums.MaterialTypes.STONE:
#		noise_value *= 0.9
	
	
	var mineral_type = null
	
	if posY < 3:
		pass
	elif posY < 15:
		mineral_type = _level_1_ore_generation(posX, posY, noise_value)
	elif posY < 25:
		mineral_type = _level_2_ore_generation(posX, posY, noise_value)
	else:
		mineral_type = _level_3_ore_generation(posX, posY, noise_value)
	
	if mineral_type != null:
		block.set_mineral(mineral_type)
	
#	if noise_value > 0.65:
#		block.set_mineral(BlockEnums.MineralTypes.COPPER) 
#	if  noise_value > 0.3:
#		if noise_value < 0.50:
#			block.set_mineral(BlockEnums.MineralTypes.COPPER) 
#		elif noise_value < 0.85:
#			block.set_mineral(BlockEnums.MineralTypes.IRON) 
#		elif noise_value < 1:
#			block.set_mineral(BlockEnums.MineralTypes.DIAMOND) 
	
	return block

func _level_1_ore_generation(x,y, noise_value):
	if noise_value > 0.80:
		return BlockEnums.MineralTypes.IRON
	elif noise_value > 0.65:
		return BlockEnums.MineralTypes.COPPER
	
	return null

func _level_2_ore_generation(x,y, noise_value):
	if noise_value > 0.72:
		return BlockEnums.MineralTypes.IRON
	elif noise_value > 0.60:
		return BlockEnums.MineralTypes.COPPER
	
	return null

func _level_3_ore_generation(x,y, noise_value):
	if noise_value > 0.78:
		return BlockEnums.MineralTypes.DIAMOND
	elif noise_value > 0.68:
		return BlockEnums.MineralTypes.IRON
	elif noise_value > 0.50:
		return BlockEnums.MineralTypes.COPPER
	
	return null

func despawn():
	self.queue_free()

func _craftNodeName(var x: int, var y: int) -> String:
	return str(x) + "," + str(y)
