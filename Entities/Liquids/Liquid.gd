extends Area2D

var fullness = 1
const WATER_FLOW = 0.05
const LAVA_FLOW = 0.03

var raycast_left
var raycast_right
var raycast_up
var raycast_bottom

var to_be_deleted: bool = false
export var liquid_type: int = 0
var base_sprite_position

var lava = load("res://Entities/Lava/Lava.tscn")
const collision_enum = preload("res://Entities/Water/WaterCollisionEnum.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	base_sprite_position = get_node("Sprite").global_position
	
	raycast_left = get_node("RayCasts/RayCastLeft")
	raycast_left.add_exception(self)
	
	raycast_right = get_node("RayCasts/RayCastRight")
	raycast_right.add_exception(self)
	
	raycast_up = get_node("RayCasts/RayCastUp")
	raycast_up.add_exception(self)
	
	raycast_bottom = get_node("RayCasts/RayCastBottom")
	raycast_bottom.add_exception(self)
	
	#TEST
	if is_in_group("Lava"):
		get_node("Sprite").texture = load("res://Entities/Liquids/lava.png")
	
	set_physics_process(false)
	update_sprite_size()



func init(position, fullness, type):
	liquid_type = type
	
	if type == collision_enum.Collision.WATER:
		self.add_to_group("Water")
	if type == collision_enum.Collision.LAVA:
		self.add_to_group("Lava")
	
	self.position = position
	self.fullness = fullness
	

# BOTTOM RAYCAST
func is_bottom_collision() -> bool:
	return _is_raycast_colliding(raycast_bottom)

func get_bottom_collider():
	return _get_raycast_collider(raycast_bottom)

func get_bottom_collider_type():
	return _get_raycast_collision_type(raycast_bottom)

# LEFT RAYCAST
func is_left_collision() -> bool:
	return _is_raycast_colliding(raycast_left)

func get_left_collider():
	return _get_raycast_collider(raycast_left)

func get_left_collider_type():
	return _get_raycast_collision_type(raycast_left)

# RIGHT RAYCAST
func is_right_collision() -> bool:
	return _is_raycast_colliding(raycast_right)

func get_right_collider():
	return _get_raycast_collider(raycast_right)

func get_right_collider_type():
	return _get_raycast_collision_type(raycast_right)


# UP RAYCAST
func is_up_collision() -> bool:
	return _is_raycast_colliding(raycast_up)

func get_up_collider():
	return _get_raycast_collider(raycast_up)

func get_up_collider_type():
	return _get_raycast_collision_type(raycast_up)


func _is_raycast_colliding(raycast):
	return raycast.is_colliding()

func _get_raycast_collider(raycast):
	return raycast.get_collider()

func _get_raycast_collision_type(raycast):
	var collider = raycast.get_collider()
	if collider != null:
		if raycast.get_collider().is_in_group("Block"):
			return collision_enum.Collision.BLOCK
		if raycast.get_collider().is_in_group("Water"):
			return collision_enum.Collision.WATER
		if raycast.get_collider().is_in_group("Lava"):
			return collision_enum.Collision.LAVA
	
#	return collision_enum.Collision.NONE
	return null

func add_liquid(adder_type):
	if not to_be_deleted:
		if adder_type == collision_enum.Collision.WATER:
			if self.is_in_group("Water"):
				fullness = min(fullness + WATER_FLOW, 1)
			else:
				remove_liquid(WATER_FLOW)
		elif adder_type == collision_enum.Collision.LAVA:
			if self.is_in_group("Water"):
				remove_liquid(LAVA_FLOW)
				
			else:
				fullness = min(fullness + LAVA_FLOW, 1)
		
		
#		_update_sprite_size()

func remove_liquid(value = WATER_FLOW):
	fullness -= value
	print("REMOVE")
	if fullness <= 0:
		to_be_deleted = true
		self.queue_free()
		return
	
#	_update_sprite_size()

func update_sprite_size():
	if is_up_collision():
		get_node("Sprite").scale.y = 2
		get_node("Sprite").global_position.y = base_sprite_position.y
	else:
		get_node("Sprite").scale.y = fullness * 2
		get_node("Sprite").global_position.y = base_sprite_position.y + (1 - fullness) * 32
#
#func _physics_process(delta):
#	var collider
#
#	if (raycast_bottom.is_colliding()):
#		collider = raycast_bottom.get_collider()
#		if collider.is_in_group("Lava"):
#			if collider.fullness < 1:
#				collider.add_water(LAVA_FLOW)
#		elif collider.is_in_group("Block"):
#			pass
#	else:
#		var lava_instance = lava.instance()
#		lava_instance.global_position = self.global_position + Vector2(0, 32)
#		print(self.global_position)
#		print(lava_instance.global_position)
#		lava_instance.fullness = LAVA_FLOW
#		get_parent().add_child(lava_instance)
