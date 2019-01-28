extends Node2D


var currentWave = 0
var roidCount = currentWave * 3
var offsetLoc = 150
var gameRunning = false
var paused = false


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	var myBackground = get_node("../").bgimage
	$background.texture = load( myBackground )
	$background
	$levelMusic.play()
	updateOverlay()
	


func updateOverlay():
	var myScore = get_node("../").score
	var myWave = get_node("../").currentWave
	var myRoidCount = get_node("../").roidCount
	var myShields = get_node("../").shields
	
	get_node("overlay/Score").set_text( str(myScore) )
	get_node("overlay/Wave").set_text( str(myWave) )
	get_node("overlay/roidCounter").set_text( str(myRoidCount) )
	get_node("overlay/Shields").value =  int (myShields) 

func _process(delta):
	updateOverlay()
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
