extends Node2D


var noise = OpenSimplexNoise.new()

func _ready():
	noise.seed = randi()
	noise.octaves = 4
	noise.period = 20.0
	noise.persistence = 0.8
	set_process(false)
	
	get_node("TextureRect").texture = noise.get_image(1024, 600)
	print(OS.get_ticks_msec())
	print(noise.get_noise_2d(1.0, 1.0))
	print(noise.get_noise_2d(2.0, 1.0))
	print(noise.get_noise_2d(3.0, 1.0))
	print(noise.get_noise_2d(4.0, 1.0))
	print(noise.get_noise_2d(5.0, 1.0))
	print(noise.get_noise_2d(6.0, 1.0))
	print(OS.get_ticks_msec())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	print(noise.get_noise_2d(1.0, 1.0))
