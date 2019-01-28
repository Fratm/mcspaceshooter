extends Node2D
#
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var roid = preload("res://Asteroid.tscn") 
var player = preload("res://Player.tscn")
var introScreen = preload("res://IntroScreen.tscn")
var nextwave = preload("res://NextWave.tscn")
var currentWave = 0
var roidCount = currentWave * 3
var offsetLoc = 150
var gameRunning = false
var paused = false
func _ready():
	#spawnRoid()
	get_node("./overlay/roidCounter").set_text( str(roidCount) )
	var myIntro = introScreen.instance()
	add_child(myIntro)
	#gameStart()



func gameStart():
	var myPlayer = player.instance()
	add_child(myPlayer)
	gameRunning = true
	$Music.playing = true
	
func _process(delta):
	if !gameRunning or paused:
			return
			
	var roidsLeft = int (get_node("./overlay/roidCounter").get_text() )
	if roidsLeft <= 0 && gameRunning:
		#Show interstential screen.
		if currentWave >= 1 :
			var between = nextwave.instance()
			paused = true
			add_child(between)
			yield(between, "tree_exited")
			paused = false
			
		currentWave += 1
		get_node("./overlay/Wave").set_text( str(currentWave) )
		roidCount = currentWave * 3
		get_node("./overlay/roidCounter").set_text( str(roidCount) )
		spawnRoid()
		

# Random roid spawn
func spawnRoid():
	print ("Spawning " + str(roidCount) + " Roids.")
	for i in range(roidCount):
		var myRoid = roid.instance()
		randomize()
		var x = rand_range(1500,  1800)
		var y = rand_range (100, 980) 
		var vel = rand_range(100, 350)
		#myRoid.linear_velocity(Vector2(0,vel))
		myRoid.position = Vector2(x,y)
		myRoid.linear_velocity = Vector2(int(-vel),0)
		print ("Setting linear velocity to :" + str(vel) )
		add_child(myRoid)
		
	pass


	
