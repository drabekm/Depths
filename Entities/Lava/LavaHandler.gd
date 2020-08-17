extends Node2D

const lava = preload("res://Entities/Lava/Lava.tscn")
const collision_enum = preload("res://Entities/Water/WaterCollisionEnum.gd")
const LAVA_FLOW = 0.05

var lava_timer 

func _ready():
	set_process_input(true)
	lava_timer = get_node("LavaMovementTimer")

func _input(event):
	if event.is_action_pressed("function"):
		get_parent().get_node("Block5").queue_free()

func _get_lava_nodes() -> Array:
	var nodes = get_children()
	nodes.remove(0) # Remove water movement timer
	nodes.remove(0) # Remove water movement timer
	nodes.sort_custom(self, "_sort_vertical")
	nodes.sort_custom(self, "_sort_horizontal")
	return nodes


func _sort_vertical(a, b):
	return a.position.y < b.position.y

func _sort_horizontal(a, b):
	return a.position.x > b.position.x

func _physics_process(delta):
	pass

func _move_lava_nodes():
	var lava_nodes = _get_lava_nodes()
	
	var collider_type
	var collider
	
	for lava_node in lava_nodes:
		
		if lava_node.is_bottom_collision():
			collider_type = lava_node.get_bottom_collider_type()
			if collider_type != null:
				collider = lava_node.get_bottom_collider()
				if collider_type == collision_enum.Collision.LAVA and collider.fullness < 1: # another water is below the water_node
					collider.add_water(LAVA_FLOW)
					lava_node.remove_water(LAVA_FLOW)
				elif collider_type == collision_enum.Collision.BLOCK or collider_type == collision_enum.Collision.LAVA and collider.fullness >= 1: # water_node sits on a block
	#				continue
					if lava_node.is_left_collision():
						collider_type = lava_node.get_left_collider_type()
						if collider_type != null:
							collider = lava_node.get_left_collider()
							if collider_type == collision_enum.Collision.LAVA:
								if collider.fullness < lava_node.fullness:
									collider.add_water(LAVA_FLOW)
									lava_node.remove_water(LAVA_FLOW)
					else:
						if lava_node.fullness > LAVA_FLOW:
							var spawn_position = lava_node.position
							spawn_position.x -= 32
							lava_node.remove_water(LAVA_FLOW)
							_spawn_lava(spawn_position)
	
					if lava_node.is_right_collision():
						collider_type = lava_node.get_right_collider_type()
						if collider_type != null:
							collider = lava_node.get_right_collider()
							if collider_type == collision_enum.Collision.LAVA:
								if collider.fullness < lava_node.fullness:
									collider.add_water(LAVA_FLOW)
									lava_node.remove_water(LAVA_FLOW)
					else:
						if lava_node.fullness > LAVA_FLOW:
							var spawn_position = lava_node.position
							spawn_position.x += 32
							lava_node.remove_water(LAVA_FLOW)
							_spawn_lava(spawn_position)
		else:
			var spawn_position = lava_node.position
			spawn_position.y += 32
			lava_node.remove_water(LAVA_FLOW)
			_spawn_lava(spawn_position)

func _spawn_lava(position):
	var lava_instance = lava.instance() # nothing below the lava_node
	lava_instance.init(position, LAVA_FLOW)
	add_child(lava_instance)

func _on_LavaMovement_timeout():
	_move_lava_nodes()


func _on_HandlerStart_timeout():
	get_node("LavaMovementTimer").start()
