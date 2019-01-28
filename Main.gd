extends Node2D

var nextwave = preload("res://NextWave.tscn")
var playfield = preload("res://PlayField.tscn")
var player = preload("res://Player.tscn")
var introScreen = preload("res://IntroScreen.tscn")
var gameover = preload("res://gameover.tscn")
var shipExplosion = preload("res://ExplosionScene.tscn")
#var overlay = preload ("res://overlay.tscn")
var roid = preload("res://Asteroid.tscn") 
var playStart = Vector2(68,200)
var currentWave = 0
var roidCount = 0
var offsetLoc = 150
var gameRunning = false
var paused = false
var bgimage = "res://assets/backgrounds/SpaceBG.png"
var score = 0
var shields = 100
var debug = true
var bonusSpawned = false
var phasebombfired = false
var phaseBombsAvailable = 2

#Display Title Screen
func _ready():
	var myIntro = introScreen.instance()
	add_child(myIntro)


func newGame():
	currentWave = 0
	phaseBombsAvailable = 2
	phasebombfired = false
	shields = 100
	score = 0
	waveStart()
	gameRunning = true



## Start the next wave.
func waveStart():
	currentWave += 1
	roidCount = currentWave * 3 
	var myPlayField = playfield.instance()
	
	var myPlayer = player.instance()
	myPlayField.set_name("pf")
	myPlayer.set_name("player")
	add_child(myPlayField)
	#add_child(myOverlay)
	$pf.add_child(myPlayer)
	spawnRoid()
	
	gameRunning = true
	#$Music.playing = true
	
# Random roid spawn
func spawnRoid():
	
	for i in range(roidCount):
		var myRoid = roid.instance()
		randomize()
		var x = rand_range(1500,  1800)
		var y = rand_range (100, 980) 
		var vel = rand_range(100, 350)
		#myRoid.linear_velocity(Vector2(0,vel))
		myRoid.position = Vector2(x,y)
		myRoid.linear_velocity = Vector2(int(-vel),0)
		$pf.add_child(myRoid)
		


func _process(delta):
	## If wave ends, pop up a stats page..
	if gameRunning && roidCount <= 0:
		gameRunning = false
		var next = nextwave.instance()
		var playership = get_tree().get_root().find_node("player", true, false)
		playership.reHomeShip(112.5,522.7)
		add_child(next)
		yield(next,"tree_exited")
		currentWave += 1
		roidCount = currentWave * 3 
		gameRunning = true
		spawnRoid()
	
	
	## If shields are at zero.. Game over..
	if shields <= 0 && gameRunning == true:
		var playership = get_tree().get_root().find_node("player", true, false)
		gameRunning = false
		playership.queue_free()
		var myEndScene = shipExplosion.instance()
		add_child(myEndScene)
		yield(myEndScene,"tree_exited")
		$pf.queue_free()
		var gover=gameover.instance()
		self.add_child(gover)

