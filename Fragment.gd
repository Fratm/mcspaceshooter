extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var fbombLaunched
var shotOffset = 10
var myPosition

func _ready():
	setFbombLocation()
	randomize()
	var yvel = rand_range(-1500, 1000)
	var xvel = rand_range(-1500, 1000)
	
	linear_velocity.y = int(yvel)
	linear_velocity.x = int(xvel)


func _on_Timer_timeout():
	queue_free()
	pass # replace with function body
	
	# THis is not working the way I would expect it.. 
func setFbombLocation():
	var playership = get_tree().get_root().find_node("player", true, false)
	var playerPos = (playership.get_global_transform())  # Get the players ship position.
	transform[2].x = playerPos[2].x 
	transform[2].y  = playerPos[2].y - 500
	
	print ("Player is at X : " + str (playerPos[2].x) + "Bomb is at X " + str ( transform[2].x) ) 
	print ("Player is at Y : " + str (playerPos[2].y) + "Bomb is at Y " + str ( transform[2].y) ) 
	
