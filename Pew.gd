extends KinematicBody2D
const UP = Vector2(0,-1)
const SPEED = 600
var motion = Vector2()
const GRAVITY  = 1

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func _physics_process(delta):
		motion.x = SPEED
		#motion.y = GRAVITY
		motion = move_and_slide(motion, UP)
		print (motion.y)
