extends Node2D

const water = preload("res://Entities/Water/Water.tscn")
const collision_enum = preload("res://Entities/Water/WaterCollisionEnum.gd")
const WATER_FLOW = 0.05

var water_timer 

func _ready():
	set_process_input(true)
	water_timer = get_node("WaterMovementTimer")

func _input(event):
	if event.is_action_pressed("function"):
		get_parent().get_node("Block5").queue_free()

func _get_water_nodes() -> Array:
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

func _move_water_nodes():
	print("water")
	var water_nodes = _get_water_nodes()
	
	var collider_type
	var collider
	
	for water_node in water_nodes:
		
		if water_node.is_bottom_collision():
			collider_type = water_node.get_bottom_collider_type()
			if collider_type != null:
				collider = water_node.get_bottom_collider()
				if collider_type == collision_enum.Collision.WATER and collider.fullness < 1: # another water is below the water_node
					collider.add_water(WATER_FLOW)
					water_node.remove_water(WATER_FLOW)
				elif collider_type == collision_enum.Collision.BLOCK or collider_type == collision_enum.Collision.WATER and collider.fullness >= 1: # water_node sits on a block
					if water_node.is_left_collision():
						collider_type = water_node.get_left_collider_type()
						if collider_type != null:
							collider = water_node.get_left_collider()
							if collider_type == collision_enum.Collision.WATER:
								if collider.fullness < water_node.fullness:
									collider.add_water(WATER_FLOW)
									water_node.remove_water(WATER_FLOW)
					else:
						if water_node.fullness > WATER_FLOW:
							var spawn_position = water_node.position
							spawn_position.x -= 32
							water_node.remove_water(WATER_FLOW)
							_spawn_water(spawn_position)
	
					if water_node.is_right_collision():
						collider_type = water_node.get_right_collider_type()
						if collider_type != null:
							collider = water_node.get_right_collider()
							if collider_type == collision_enum.Collision.WATER:
								if collider.fullness < water_node.fullness:
									collider.add_water(WATER_FLOW)
									water_node.remove_water(WATER_FLOW)
					else:
						if water_node.fullness > WATER_FLOW:
							var spawn_position = water_node.position
							spawn_position.x += 32
							water_node.remove_water(WATER_FLOW)
							_spawn_water(spawn_position)
			else:
				print("add water")
				var spawn_position = water_node.position
				spawn_position.y += 32
				water_node.remove_water(WATER_FLOW)
				_spawn_water(spawn_position)

func _spawn_water(position):
	var water_instance = water.instance() # nothing below the water_node
	water_instance.init(position, WATER_FLOW)
	add_child(water_instance)

func _on_WaterMovement_timeout():
	_move_water_nodes()


func _on_TimerTest_timeout():
	get_node("WaterMovementTimer").start()
