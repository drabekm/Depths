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

var sprite : AnimatedSprite

var forwardDrill
var bottomDrill

var inventory
var corner_shadow

var current_drill_block
var drill_sprite: AnimatedSprite
var drill_sprite_mover : AnimationPlayer
var is_drilling: bool = false
var was_drilling_up: bool = false
var was_drilling_down: bool = false
var drill_particles: Particles2D
var drill_sound: AudioStreamPlayer
var drill_sound_end_timer: Timer

func _ready():
	Earthquake.game_start()
	sprite = get_node("Sprite")
	forwardDrill = get_node("ForwardDrill")
	bottomDrill = get_node("BottomDrill")
	inventory = get_node("../Menus/Inventory")
	corner_shadow = get_node("CornerShadow")
	drill_sprite = get_node("Sprite/Drill")
	drill_sprite_mover = get_node("Sprite/Drill/DrilMover")
	drill_particles = get_node("Sprite/Drill/DrillParticles")
	drill_sound = get_node("Sprite/Drill/DrillSound")
	drill_sound_end_timer = get_node("Sprite/Drill/DrillSound/DrillSoundEndTimer")
	if PlayerData.position != Vector2(0,0):
		self.global_position = PlayerData.position
	
	set_process(true)
	set_physics_process(true)

func _process(delta):
	update_debug_labels()
	_update_shadow_opacity()
	_update_animation()
	_update_thruster()

func _physics_process(delta):
	if current_drill_block == null:
		input()
		_movement()
	else:
		_drilling_move(delta)
	
	
	_subtract_fuel(delta)

func _update_thruster():
	
	if is_thrusters_on:
		get_node("Sprite/Thruster").emitting = true
		if not get_node("Sprite/RocketSoundPlayer").playing:
			get_node("Sprite/RocketSoundPlayer").play()
	else:
		get_node("Sprite/Thruster").emitting = false
		get_node("Sprite/RocketSoundPlayer").stop()

func _update_shadow_opacity():
	corner_shadow.energy = min(1, position.y / 720)

func _drilling_move(delta):
	self.position = self.position.linear_interpolate(Vector2(self.position.x, current_drill_block.global_position.y + 32), 2.0 * delta)
	self.position = self.position.linear_interpolate(Vector2(current_drill_block.global_position.x + 32, self.position.y), 4.0 * delta)
	
	# Drilling finish
	if self.position.distance_to(current_drill_block.global_position + Vector2(32,32)) < 10:
		current_drill_block.destroy()
		drill_sound_end_timer.start()
		$CollisionShape2D.disabled = false
		current_drill_block = null
		is_drilling = false
		get_node("Sprite/Drill/DrillResetTimer").start()
		drill_sprite.play("idle")
		was_drilling_down = false
		was_drilling_up = false

# Drill is represented by a raycast2D node
# This method is used only when the player is pushing against either a wall or
# a floor. We need to check if the wall is actually a drillable block
func _drill_colides_with_block(drill) -> bool:
	var collider = drill.get_collider()
	if collider != null:
		return collider.is_in_group("Block")
	return false

func _start_drilling(drill: Node, is_bottom_drill, is_up_drill):
	if _drill_colides_with_block(drill):
				is_drilling = false
				drill_sound_end_timer.stop()
				if not drill_sound.playing:
					drill_sound.play()
				if is_bottom_drill:
					was_drilling_down = true
					drill_sprite.play("elongate")
					if floor(drill_sprite.rotation_degrees) != 90:
						drill_sprite_mover.play("move_down")
				else:
					if floor(drill_sprite.rotation_degrees) == 90:
						drill_sprite_mover.play_backwards("move_down")
					if floor(drill_sprite.rotation_degrees) == -90:
						drill_sprite_mover.play_backwards("move_up")
					drill_sprite.play("drill")
				
				drill_particles.emitting = true
				var collider = drill.get_collider()
				if collider.has_mineral:
					PlayerData.add_mineral(collider.mineral_type)
				current_drill_block = collider
				$CollisionShape2D.disabled = true
				PlayerData.score += collider.score

# Change drills direction when player changes side
func _reorient_drill(direction) -> void: # -1 = left, 1 = right
	forwardDrill.scale.x = direction

func _reorient_sprite(direction) -> void:
	sprite.scale.x = direction

func _reorient_collision(direction) -> void:
	get_node("CollisionShape2D").scale.x = direction

func input() -> void:
	is_moving = false
	var acceleration = PlayerData.acceleration
	var max_speed = PlayerData.max_speed
	
	is_thrusters_on = false
	if Input.is_action_pressed("ui_up"):
		is_thrusters_on = true
		velocity.y = velocity.y - PlayerData.thurster_power
		is_moving = true
	elif Input.is_action_pressed("ui_down"):
		if is_on_floor():
			_start_drilling(bottomDrill, true, false)
	
	if Input.is_action_pressed("ui_left"):
		_reorient_drill(-1)
		_reorient_sprite(-1)
		_reorient_collision(-1)
		is_moving = true
		velocity.x = max(velocity.x - acceleration, -max_speed)
		if is_on_wall() and is_on_floor():
			_start_drilling(forwardDrill, false, false)
		
	elif Input.is_action_pressed("ui_right"):
		_reorient_drill(1)
		_reorient_sprite(1)
		_reorient_collision(1)
		is_moving = true
		velocity.x = min(velocity.x + acceleration, max_speed)
		if is_on_wall() and is_on_floor():
			_start_drilling(forwardDrill, false, false)
	else:
		if(self.is_on_floor()):
			velocity.x = lerp(velocity.x, 0, SPEED_SLOWDOWN)
		else:
			velocity.x = lerp(velocity.x, 0, SPEED_SLOWDOWN_AIR)
	
	if Input.is_action_just_pressed("ui_page_up"):
		GlobalMapData.restore_blocks()

func _update_animation():
	if is_moving and sprite.animation != "moving":
		sprite.play("moving")
	elif not is_moving and sprite.animation == "moving":
		sprite.play("idle")
	

func _subtract_fuel(delta: float)-> void:
	if is_moving:
		PlayerData.remove_fuel(PlayerData.fuel_consumption * delta)
#		PlayerData.fuel -= PlayerData.fuel_consumption * delta


func _movement() -> void:
	velocity.y = velocity.y + GRAVITY_ACC
	var previous_vertical_velocity = velocity.y
	velocity = move_and_slide(velocity, Vector2(0,-1))
	PlayerData.position = self.global_position
	
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


func _on_Drill_animation_finished():
	if drill_sprite.animation == "elongate":
		drill_sprite.play("elongate_drill")


func _on_DrillResetTimer_timeout():
	print("reseted")
	print(floor(rad2deg(drill_sprite.rotation)))
	if floor(rad2deg(drill_sprite.rotation)) == 90:
		drill_sprite_mover.play("move_center_from_bottom")
	if floor(rad2deg(drill_sprite.rotation)) == -90:
		drill_sprite_mover.play("move_center_from_up")


func _on_DrillSoundEnd_timeout():
	print("timeout")
	drill_sound.stop()
