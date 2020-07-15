extends KinematicBody2D

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

func _ready():
	forwardDrill = get_node("ForwardDrill")
	bottomDrill = get_node("BottomDrill")
	inventory = get_node("../Menus/Inventory")
	
	set_process(true)
	set_physics_process(true)

func _process(delta):
	update_debug_labels()

func _physics_process(delta):
	input()
	_movement()
	_subtract_fuel(delta)

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
		PlayerData.fuel -= PlayerData.fuel_consumption * delta


func _movement() -> void:
	velocity.y = velocity.y + GRAVITY_ACC
	velocity = move_and_slide(velocity, Vector2(0,-1))
	
	if self.is_on_floor():
		_kill_vertical_velocity()
	elif self.is_on_ceiling() and is_thrusters_on:
		_kill_vertical_velocity()

func _kill_vertical_velocity() -> void:
	velocity.y = 0

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
