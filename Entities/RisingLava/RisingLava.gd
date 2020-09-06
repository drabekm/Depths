extends Area2D


var earthquake_triggered: bool = false
const default_speed = 50
func _ready():
	Earthquake.connect("earthquake_triggered", self, "_on_earthquake_triggered")
	
	
	set_physics_process(true)

func _physics_process(delta):
	if earthquake_triggered:
		self.global_position = Vector2(PlayerData.position.x ,self.global_position.y - (default_speed * delta))
	else:
		self.global_position = PlayerData.position

func _on_earthquake_triggered():
	earthquake_triggered = true
	self.visible = true
	$BigParticles.emitting = true


func _on_RisingLava_body_entered(body):
	PlayerData.remove_health(999999)
