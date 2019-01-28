extends VideoPlayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	pass

func _process(delta):
	if not is_playing():
        play()


