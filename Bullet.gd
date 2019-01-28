#extends KinematicBody2D
extends RigidBody2D
const UP = Vector2(0,-1)
const SPEED = 600
var motion = Vector2()
const GRAVITY  = 1
var playerPosition = Vector2()
var orignalPostion = Vector2()
var var2
var shotFired = false
var shotOffset = 75
func _ready():
		pass
		


func setBulletPosition(playerPosition):

		playerPosition[2].x += shotOffset  # Set to +80 se we don't hit our own ship.
		orignalPostion = get_global_transform() # Lets grab the current transform..
		orignalPostion[2] = playerPosition[2] # Copy X and Y to Original -- Not touching anything else
		transform = orignalPostion # Stuff it into the Pew tranform
		shotFired = true # Set shot fired to tru.

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _physics_process(delta):
	pass

func _on_onscreen_viewport_exited( viewport ):
	queue_free()


func _on_Bullet_body_entered( body ):

	queue_free()
	pass # replace with function body
