extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var myscale = Vector2(1,1)
var shotOffset = 80
var playerPosition = Vector2()
var orignalPostion = Vector2()
var mainNode

func _ready():
	# If we have no bombs to launch, just die.
	mainNode = get_tree().get_root().find_node("Main", true, false)
	if mainNode.phaseBombsAvailable < 1:
		queue_free()
	# Decrease the available bombs.
	mainNode.phaseBombsAvailable -=1 

func setPosition(playerPosition):
	playerPosition[2].x += shotOffset  # Set to +80 se we don't hit our own ship.
	orignalPostion = get_global_transform() # Lets grab the current transform..
	orignalPostion[2] = playerPosition[2] # Copy X and Y to Original -- Not touching anything else
	transform = orignalPostion # Stuff it into the transform

func _physics_process(delta):
	if myscale.x < 4:
		myscale.x += .1
		myscale.y += .1
		set_scale(myscale)
	else:
		mainNode.phasebombfired = false
		queue_free()
