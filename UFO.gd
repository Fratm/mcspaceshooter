extends Path2D

onready var follow = get_node("follow")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	follow.set_offset(follow.get_offset() + 550 * delta)
	
