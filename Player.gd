extends KinematicBody2D

var bullet = preload("res://Bullet.tscn")  # Loads up the bullet object
var fbomb = preload("res://PhaseBomb.tscn") # Load fuzzy bomb
const UP = Vector2(0,-1)
const GRAVITY =0
const SPEED = 600
var motion = Vector2()
var anim = "idle"
var doubleJump = false
var damaged = false
var ishooting = false
var myShot
var playerPos = Vector2()
var screensize = Vector2()
var shake_amount = 0
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	screensize = get_viewport().size.y

func selfDestruct():
	$Sprite.play("explosion")
	print ("Self Destruct!")
	yield($Sprite,"animation_finished")
	print ("Destruction Sequence Completed!")
	return



func reHomeShip(newlocx,newlocy):
	var currentloc = get_global_transform()
	currentloc[2] = Vector2(newlocx,newlocy) # Copy X and Y to Original -- Not touching anything else
	transform = currentloc # Stuff it into the Pew tranform 
	return

func deployShields():
	$Sprite.play("shield")
	$shieldHit.play()
	yield($Sprite,"animation_finished")
	$Sprite.play("default")
	$shieldHit.stop()
	
func _physics_process(delta):
	
	var isPlaying = get_node("../../").gameRunning
	if !isPlaying:
		return
	
	
	playerPos = (self.get_global_transform())
	motion.y += GRAVITY
# Let's deal with Up Down movement
	if Input.is_action_pressed("ui_up") && playerPos[2].y > 45:
		#$playerSprite.flip_h = false
		#$playerSprite.transform.get_rotation()
		motion.y = -SPEED
	elif Input.is_action_pressed("ui_down") && playerPos[2].y < 1080:
		#$playerSprite.flip_h = true
		motion.y = SPEED
	else:
		motion.y = 0
		anim = "idle"
# Right and left movement.
	if Input.is_action_pressed("ui_right") && playerPos[2].x < 1800:
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left") && playerPos[2].x > 68:
		motion.x = -SPEED
	else:
		motion.x =0
		anim = "idle"
	
	if (Input.is_action_just_released("ui_select") && ishooting):
		ishooting = false
		
	
	if (Input.is_action_pressed("ui_select") && !ishooting):
		ishooting = true
		myShot = bullet.instance()
		myShot.setBulletPosition(playerPos)
		get_parent().add_child(myShot)
		$sound.play()
		
		
		
	motion = move_and_slide(motion, UP)
	var lastMotion = motion.y

func _input(event):
	#Launch fbomb here!
		if event is InputEventKey and char(event.scancode) == "F" && get_node("../../").phasebombfired == false:
			playerPos = (self.get_global_transform())
			get_node("../../").phasebombfired = true
			var myfbomb = fbomb.instance()
			myfbomb.setPosition(playerPos)
			get_parent().add_child(myfbomb)
	
