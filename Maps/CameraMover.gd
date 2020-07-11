extends Camera2D


func _ready():
	
	set_physics_process(true)



func _physics_process(delta):
	if Input.is_action_pressed("ui_up"):
		position.y -= 5
	if Input.is_action_pressed("ui_down"):
		position.y += 5
	if Input.is_action_pressed("ui_right"):
		position.x += 5
	if Input.is_action_pressed("ui_left"):
		position.x -= 5
	
	get_node("Control/VBoxContainer/pos").text = "pos: " + str(position)
	get_node("Control/VBoxContainer/block").text = "block: " + str(position / 32)
