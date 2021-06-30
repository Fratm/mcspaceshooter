extends RigidBody2D
var bonusItem = preload("res://bonusItem.tscn")
var ufo = preload("res://UFO.tscn")

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var myLife = 100
var hitCount = 0
var hitprocess = false
var roidPos = Vector2()
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	$Sprite.play("0")
	
#Debug Fnction DELETE ME
func _input(event):
	if event is InputEventKey:
		if  event.pressed and event.scancode == KEY_B:
			spawnBonus()
		elif event.pressed and event.scancode == KEY_N:
			spawnUFO()
		elif event.pressed and event.scancode == KEY_H:
			var playership = get_tree().get_root().find_node("player", true, false)
			playership.reHomeShip(112.5,522.7)


func setRoidPosition(roidPosition):
	var original = get_global_transform()
	var newSpawn = original
	newSpawn[2] = roidPosition
	var velo = Vector2(500,0)
	linear_velocity = (velo)
	Transform(newSpawn)
	
func _on_Asteroid_body_entered( body ):
	# Lets get the node id of what we hit.
	var test = get_colliding_bodies()  
	
	# If we are already processing a hit on this roid, lets return, to prevent race conditions
	if hitprocess:
		return
		
	# Let us tell everyone we are already processing a hit.
	hitprocess = true  # Set this flag so we can't double tap during animations.
	
	# Find the border walls.
	var borderNode = get_tree().get_root().find_node("pf", true, false)
	
	# Find the player
	var playership = get_tree().get_root().find_node("player", true, false)
	
	if playership == test[0]:
		playership.deployShields()
		apply_impulse(Vector2(0,0),Vector2(500,90))
		get_node("../../").shields -= 25
		
		
		
	
	# If Asteroid hits any boundry except far left, then bounce.
	if borderNode.get_node("borders").get_node("Rightwall") == test[0]  or \
	   borderNode.get_node("borders").get_node("Top") == test[0] or\
	   borderNode.get_node("borders").get_node("Bottom") == test[0]:
		hitprocess = false
		return
	
	# If we hit the far left, then despawn, don't increment score.
	if borderNode.get_node("borders").get_node("LeftWall") == test[0] :
		var CurrentRoidCount = get_node("../../").roidCount
		CurrentRoidCount -= 1
		get_node("../../").roidCount = CurrentRoidCount
		hitprocess = false
		queue_free()
		return

	hitCount += 1   #Count a hit..
	myLife -= 34   # Take some life away.
	
	#If this kills the asteroid, then we will decrease counter, and de-spawn the roid.
	if (myLife <= 0) :
		$Sprite.play("explosion")
		$explosionSound.play()
		## Decrease the roid counter.
		var CurrentRoidCount = get_node("../../").roidCount
		CurrentRoidCount -= 1
		get_node("../../").roidCount = CurrentRoidCount
		
		yield($explosionSound, "finished") # Finish out animation before removing object.
		queue_free()
		hitCount = 0
		#$Sprite.play(var2str(hitCount))
	else:
		$Sprite.play("explosion")
		
		var currentScore = get_node("../../").score
		var newScore = str(currentScore + 10)
		get_node("../../").score = int (newScore)
		$explosionSound.play()
		#$Sprite.play(var2str(hitCount))
		# Did we spawn a prize??
		randomize()
		var prizeChance = int ( rand_range(100 , 1000) )
		if prizeChance > 800 && prizeChance < 825:
			#Spawn the bonusItem
			spawnBonus()
		
	hitprocess = false


func spawnBonus():
	roidPos = (self.get_global_transform())
	#roidPos.x = roidPos.x - 10
	var myBonus = bonusItem.instance()
	myBonus.setBonusPosition(roidPos)
	get_parent().add_child(myBonus) 

func spawnUFO():
	var myUFO = ufo.instance()
	get_parent().add_child(myUFO)

func _on_Sprite_animation_finished():
	$Sprite.play(var2str(hitCount))
	pass # replace with function body


