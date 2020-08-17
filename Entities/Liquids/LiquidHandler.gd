extends Node2D


const liquid_scene = preload("res://Entities/Liquids/Liquid.tscn")


const collision_enum = preload("res://Entities/Water/WaterCollisionEnum.gd")

const WATER_FLOW = 0.05
const LAVA_FLOW = 0.03

var can_move = false

func _ready():
	set_physics_process(true)


func _on_StartTimer_timeout():
	
	get_node("LiquidMovement").start()

func _get_water_nodes():
	var water_nodes = get_tree().get_nodes_in_group("Water")
	return _sort_nodes(water_nodes)

func _get_lava_nodes():
	var lava_nodes = get_tree().get_nodes_in_group("Lava")
	return _sort_nodes(lava_nodes)

func _sort_nodes(nodes: Array):
	nodes.sort_custom(self, "_sort_vertical")
	nodes.sort_custom(self, "_sort_horizontal")
	return nodes

func _on_LiquidMovement_timeout():
	can_move = true
#	_move_water()

func _physics_process(delta):
	if can_move:
		_move_water()
		_move_lava()
		can_move = false

func _move_lava():
	var lava_nodes = _get_lava_nodes()
	for lava_node in lava_nodes:
		_handle_bottom_collision(lava_node)
		lava_node.update_sprite_size()

func _move_water():
	var water_nodes = _get_water_nodes()
	for water_node in water_nodes:
		_handle_bottom_collision(water_node)
		water_node.update_sprite_size()

func _spawn_liquid(node_type, position, x_offset, y_offset):
	var spawn_position = Vector2(position.x + x_offset, position.y + y_offset)
	if node_type == collision_enum.Collision.WATER:
		_spawn_water(spawn_position)
	elif node_type == collision_enum.Collision.LAVA:
		_spawn_lava(spawn_position)

func _spawn_water(position):
	var water_instance = liquid_scene.instance() # nothing below the lava_node
	water_instance.init(position, WATER_FLOW, collision_enum.Collision.WATER)
	add_child(water_instance)

func _spawn_lava(position):
	var lava_instance = liquid_scene.instance() # nothing below the lava_node
	lava_instance.init(position, LAVA_FLOW, collision_enum.Collision.LAVA)
	add_child(lava_instance)

func _handle_bottom_collision(var node):
	var is_water = node.is_in_group("Water")
	var is_lava = node.is_in_group("Lava")
	
	var collider_type
	var collider
	
	if node.is_bottom_collision():
		collider_type = node.get_bottom_collider_type()
#		print("aaa")
		if collider_type != null:
			collider = node.get_bottom_collider()
			if collider_type != collision_enum.Collision.BLOCK:
				if (collider_type == collision_enum.Collision.WATER and collider.fullness < 1 and node.liquid_type == collision_enum.Collision.WATER) or (collider_type == collision_enum.Collision.LAVA and collider.fullness < 1 and node.liquid_type == collision_enum.Collision.LAVA) or (node.liquid_type != collider_type):
					_handle_liquid_collider(node, collider, collider_type, true)
				else:
					_handle_left_right_collisions(node, collider, collider_type)
			else:
				#can't flow down or merge with other fluid
				if node.is_left_collision():
					collider = node.get_left_collider()
					collider_type = node.get_left_collider_type()
					if collider_type != null:
						if collider_type != collision_enum.Collision.BLOCK:
							if (collider_type == collision_enum.Collision.WATER and collider.fullness < 1 and node.liquid_type == collision_enum.Collision.WATER) or (collider_type == collision_enum.Collision.LAVA and collider.fullness < 1 and node.liquid_type == collision_enum.Collision.LAVA) or (node.liquid_type != collider_type):
								_handle_liquid_collider(node, collider, collider_type)
				else:
					#spawn liquid on left
					if node.is_in_group("Water"):
						_spawn_liquid(collision_enum.Collision.WATER, node.position, -64, 0)
					elif node.is_in_group("Lava"):
						_spawn_liquid(collision_enum.Collision.LAVA, node.position, -64, 0)
					
				if node.is_right_collision():
					collider = node.get_right_collider()
					collider_type = node.get_right_collider_type()
					if collider_type != null:
						if collider_type != collision_enum.Collision.BLOCK:
							if (collider_type == collision_enum.Collision.WATER and collider.fullness < 1 and node.liquid_type == collision_enum.Collision.WATER) or (collider_type == collision_enum.Collision.LAVA and collider.fullness < 1 and node.liquid_type == collision_enum.Collision.LAVA) or (node.liquid_type != collider_type):
								_handle_liquid_collider(node, collider, collider_type)
				else:
					#spawn liquid on left
					if node.is_in_group("Water"):
						_spawn_liquid(collision_enum.Collision.WATER, node.position, 64, 0)
					elif node.is_in_group("Lava"):
						_spawn_liquid(collision_enum.Collision.LAVA, node.position, 64, 0)
				
	else:
		if node.is_in_group("Water"):
			_spawn_liquid(collision_enum.Collision.WATER, node.position, 0, 64)
		elif node.is_in_group("Lava"):
			_spawn_liquid(collision_enum.Collision.LAVA, node.position, 0, 64)

func _handle_left_right_collisions(current_node, collider, collider_type):
	if current_node.is_left_collision():
		collider = current_node.get_left_collider()
		collider_type = current_node.get_left_collider_type()
		if collider_type != null:
			if collider_type != collision_enum.Collision.BLOCK:
				if (collider_type == collision_enum.Collision.WATER and collider.fullness < 1 and current_node.liquid_type == collision_enum.Collision.WATER) or (collider_type == collision_enum.Collision.LAVA and collider.fullness < 1 and current_node.liquid_type == collision_enum.Collision.LAVA) or (current_node.liquid_type != collider_type):
					_handle_liquid_collider(current_node, collider, collider_type)
	else:
		#spawn liquid on left
		if current_node.is_in_group("Water"):
			_spawn_liquid(collision_enum.Collision.WATER, current_node.position, -64, 0)
		elif current_node.is_in_group("Lava"):
			_spawn_liquid(collision_enum.Collision.LAVA, current_node.position, -64, 0)
		
	if current_node.is_right_collision():
		collider = current_node.get_right_collider()
		collider_type = current_node.get_right_collider_type()
		if collider_type != null:
			if collider_type != collision_enum.Collision.BLOCK:
				if (collider_type == collision_enum.Collision.WATER and collider.fullness < 1 and current_node.liquid_type == collision_enum.Collision.WATER) or (collider_type == collision_enum.Collision.LAVA and collider.fullness < 1 and current_node.liquid_type == collision_enum.Collision.LAVA) or (current_node.liquid_type != collider_type):
					_handle_liquid_collider(current_node, collider, collider_type)
	else:
		#spawn liquid on left
		if current_node.is_in_group("Water"):
			_spawn_liquid(collision_enum.Collision.WATER, current_node.position, 64, 0)
		elif current_node.is_in_group("Lava"):
			_spawn_liquid(collision_enum.Collision.LAVA, current_node.position, 64, 0)

#Bottom block is a liquid node and not completely full
func _handle_liquid_collider(current_node, collider, collider_type, is_bottom_collision = false):
	if current_node.liquid_type == collider_type and not is_bottom_collision:
		if abs(current_node.fullness - collider.fullness) < 0.05:
			return 
	
	collider.add_liquid(current_node.liquid_type)
	if current_node.is_in_group("Lava"):
		current_node.remove_liquid(LAVA_FLOW)
	elif current_node.is_in_group("Water"):
		current_node.remove_liquid(WATER_FLOW)


