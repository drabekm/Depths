extends KinematicBody2D

# I always hated the player script in every game I've made
# It's the most important thing, with most features usually
# So it's usually pretty long and clustered full of confusing shit

# The code here isn't that confusing hopefully, but it might change soon

var velocity = Vector2(0,0)
var speed = 0
var gravity = 0

var is_thrusters_on: bool = false
var is_moving: bool = false


const GRAVITY_ACC = 7
const SPEED_SLOWDOWN = 0.25
const SPEED_SLOWDOWN_AIR = 0.005

var forwardDrill
var bottomDrill

var inventory
var corner_shadow

func _ready():
	forwardDrill = get_node("ForwardDrill")
	bottomDrill = get_node("BottomDrill")
	inventory = get_node("../Menus/Inventory")
	corner_shadow = get_node("CornerShadow")
	PlayerData.reset()
	set_process(true)
	set_physics_process(true)

func _process(delta):
	update_debug_labels()
	_update_shadow_opacity()

func _physics_process(delta):
	input()
	_movement()
	_subtract_fuel(delta)

func _update_shadow_opacity():
	corner_shadow.energy = min(1, position.y / 720)

# Drill is represented by a raycast2D node
# This method is used only when the player is pushing against either a wall or
# a floor. We need to check if the wall is actually a drillable block
func _drill_colides_with_block(drill) -> bool:
	var collider = drill.get_collider()
	if collider != null:
		return collider.is_in_group("Block")
	return false

func _start_drilling(drill: Node):
	if _drill_colides_with_block(drill):
				var collider = drill.get_collider()
				if collider.has_mineral:
					PlayerData.add_mineral(collider.mineral_type)
				
				PlayerData.score += collider.score
				collider.destroy()

# Change drills direction when player changes side
func reorient_drill(direction) -> void: # -1 = left, 1 = right
	forwardDrill.scale.x = direction

func input() -> void:
	is_moving = false
	var acceleration = PlayerData.acceleration
	var max_speed = PlayerData.max_speed
	
	if Input.is_action_pressed("ui_up"):
		velocity.y = velocity.y - PlayerData.thurster_power
		is_moving = true
	elif Input.is_action_pressed("ui_down"):
		if is_on_floor():
			_start_drilling(bottomDrill)
	
	if Input.is_action_pressed("ui_left"):
		reorient_drill(-1)
		is_moving = true
		velocity.x = max(velocity.x - acceleration, -max_speed)
		if is_on_wall() and is_on_floor():
			_start_drilling(forwardDrill)
		
	elif Input.is_action_pressed("ui_right"):
		reorient_drill(1)
		is_moving = true
		velocity.x = min(velocity.x + acceleration, max_speed)
		if is_on_wall() and is_on_floor():
			_start_drilling(forwardDrill)
	else:
		if(self.is_on_floor()):
			velocity.x = lerp(velocity.x, 0, SPEED_SLOWDOWN)
		else:
			velocity.x = lerp(velocity.x, 0, SPEED_SLOWDOWN_AIR)

func _subtract_fuel(delta: float)-> void:
	if is_moving:
		PlayerData.remove_fuel(PlayerData.fuel_consumption * delta)
#		PlayerData.fuel -= PlayerData.fuel_consumption * delta


func _movement() -> void:
	velocity.y = velocity.y + GRAVITY_ACC
	var previous_vertical_velocity = velocity.y
	velocity = move_and_slide(velocity, Vector2(0,-1))
	
	
	if self.is_on_floor():
		_remove_health_from_speed_collision(previous_vertical_velocity)
		_kill_vertical_velocity()
	elif self.is_on_ceiling() and is_thrusters_on:
		_kill_vertical_velocity()
		_remove_health_from_speed_collision(previous_vertical_velocity)

func _kill_vertical_velocity() -> void:
	velocity.y = 0

func _remove_health_from_speed_collision(vertical_velocity):
	if vertical_velocity > 300:
			PlayerData.remove_health(pow(vertical_velocity * 0.01, 2))
#			PlayerData.health -= pow(vertical_velocity * 0.01, 2)

func update_debug_labels() -> void:
	get_node("DEBUG/labels/health").text = "Health: " + str(PlayerData.health)
	get_node("DEBUG/labels/score").text = "Score: " + str(PlayerData.score)
	get_node("DEBUG/labels/money").text = "Money: " + str(PlayerData.money)
	get_node("DEBUG/labels/velocity").text = "Velocity: " + str(velocity)
	get_node("DEBUG/labels/fuel").text = "Fuel: " + str(PlayerData.fuel)
	get_node("DEBUG/labels/on_floor").text = "On floor: " + str(is_on_floor())
	get_node("DEBUG/labels/on_ceiling").text = "On ceiling: " + str(is_on_ceiling())
	get_node("DEBUG/labels/on_wall").text = "On wall: " + str(is_on_wall())
	get_node("DEBUG/labels/fps").text = "FPS: " + str(Engine.get_frames_per_second())
	get_node("DEBUG/labels/position").text = "POS: " + str(self.position)
