extends Path2D
onready var follow = get_node("follow")
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	follow.set_offset(follow.get_offset() + 200 * delta)
	
