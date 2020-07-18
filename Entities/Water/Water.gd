extends Area2D

var fullness = 1
const flow_speed = 0.02

var raycast_left
var raycast_right
var raycast_up
var raycast_bottom

var base_sprite_position

var water = load("res://Entities/Water/Water.tscn")
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
	
	set_physics_process(false)
	_update_sprite_size()

func init(position, water_fullness):
	self.position = position
	self.fullness = water_fullness
	

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
	
#	return collision_enum.Collision.NONE
	return null

func add_water(value):
	fullness = min(fullness + value, 1)
	_update_sprite_size()

func remove_water(value):
	fullness -= value
	
	if fullness <= 0:
		self.queue_free()
	
	_update_sprite_size()

func _update_sprite_size():
	get_node("Sprite").scale.y = fullness
	get_node("Sprite").global_position.y = base_sprite_position.y + (1 - fullness) * 16

func _physics_process(delta):
	var collider
	
	if (raycast_bottom.is_colliding()):
		collider = raycast_bottom.get_collider()
		if collider.is_in_group("Water"):
			if collider.fullness < 1:
				collider.add_water(flow_speed)
		elif collider.is_in_group("Block"):
			pass
	else:
		var water_instance = water.instance()
		water_instance.global_position = self.global_position + Vector2(0, 32)
		print(self.global_position)
		print(water_instance.global_position)
		print("========")
		water_instance.fullness = flow_speed
		get_parent().add_child(water_instance)
