extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var flash = false
var count = 0
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	if count > 60 :
		count = 0
		if flash == true:
			$GameOverLabel.hide()
			flash = false
		else:
			$GameOverLabel.show()
			flash = true
	count +=1

func _on_Play_Again_pressed():
	get_parent().newGame()
	queue_free()

func _on_ButtonQuit_pressed():
	get_tree().quit()
