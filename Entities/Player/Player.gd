extends KinematicBody2D

var velocity = Vector2(0,0)
var speed = 0
var gravity = 0
var is_thrusters_on: bool = false

const GRAVITY_ACC = 7
const SPEED_SLOWDOWN = 0.25
const SPEED_SLOWDOWN_AIR = 0.005


func _ready():
	set_process(true)
	set_physics_process(true)

func _process(delta):
	update_debug_labels()

func _physics_process(delta):
	input()
	movement()

func input():
	
	var thurster_power = PlayerData.thurster_power
	var acceleration = PlayerData.acceleration
	var max_speed = PlayerData.max_speed
	
	if Input.is_action_pressed("ui_up"):
		velocity.y = velocity.y - PlayerData.thurster_power
	elif Input.is_action_pressed("ui_down"):
		pass
	
	if Input.is_action_pressed("ui_left"):
		print("left")
		velocity.x = max(velocity.x - acceleration, -max_speed)
	elif Input.is_action_pressed("ui_right"):
		print("right")
		velocity.x = min(velocity.x + acceleration, max_speed)
	else:
		if(self.is_on_floor()):
			velocity.x = lerp(velocity.x, 0, SPEED_SLOWDOWN)
		else:
			velocity.x = lerp(velocity.x, 0, SPEED_SLOWDOWN_AIR)

func movement():
	velocity.y = velocity.y + GRAVITY_ACC
	velocity = move_and_slide(velocity, Vector2(0,-1))
	
	if self.is_on_floor():
		_kill_vertical_velocity()
	elif self.is_on_ceiling() and is_thrusters_on:
		_kill_vertical_velocity()

func _kill_vertical_velocity():
	velocity.y = 0

func update_debug_labels():
	get_node("DEBUG/velocity").text = "Velocity: " + str(velocity)
	get_node("DEBUG/fuel").text = "Fuel: " + str(PlayerData.fuel)
	get_node("DEBUG/on_floor").text = "On floor: " + str(is_on_floor())
	get_node("DEBUG/on_ceiling").text = "On ceiling: " + str(self.is_on_ceiling())




