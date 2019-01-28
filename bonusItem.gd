extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var spawned = false
var shieldBonus = 15

func _ready():
	if get_node("../../").bonusSpawned:
		queue_free()
		return
	else:
		get_node("../../").bonusSpawned = true

func _process(delta):
	$Sprite.rotation +=1
	
func setBonusPosition(bonusPosition):
	return
	var original = get_global_transform()
	var newSpawn = original
	newSpawn[2] = bonusPosition
	var velo = Vector2(500,0)
	linear_velocity = (velo)
	Transform(newSpawn)


func _on_bonusItem_body_entered( body ):
	var test = get_colliding_bodies() 
	var playership = get_tree().get_root().find_node("player", true, false)
	var borderNode = get_tree().get_root().find_node("pf", true, false)
	# Test if player hit the bonus item.
	if playership == test[0]:
		playership.deployShields()
		var shieldLevels = get_node("../../").shields
		print ("Shields currently at :" +str (shieldLevels) )
		if shieldLevels <= (100-shieldBonus) :
			get_node("../../").shields += 15
		else:
			get_node("../../").shields = 100
		get_node("../../").bonusSpawned = false
		queue_free()
		
	if borderNode.get_node("borders").get_node("LeftWall") == test[0] :
		get_node("../../").bonusSpawned = false
		queue_free()
		


func _on_bonusItem_tree_exited():
	get_node("../../").bonusSpawned = false
