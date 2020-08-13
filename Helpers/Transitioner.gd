extends Control

var animation_player: AnimationPlayer
signal transition_finished

func _ready():
	animation_player = get_node("ColorRect/AnimationPlayer")
	open()

func close():
	self.visible = true
	animation_player.play("Close")

func open():
	animation_player.play("Open")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Open":
		self.visible = false
	emit_signal("transition_finished")
