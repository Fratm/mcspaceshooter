extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var scrollSpeed = 1

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	position.x -= scrollSpeed
#	pass
