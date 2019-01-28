extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var offsetLoc = 150
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	offsetLoc = offsetLoc + 150 * delta
	set_position(Vector2(-offsetLoc,0))
