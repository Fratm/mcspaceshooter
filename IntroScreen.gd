extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	$introMusic.play()
	$VideoPlayer.play()
	pass

func _on_ButtonStart_pressed():
	get_parent().gameRunning = true
	get_parent().waveStart()
	queue_free()
	
	


func _on_ButtonQuit_pressed():
	get_tree().quit()


func _on_ButtonCredits_pressed():
	get_tree().change_scene("res://about.tscn")
	pass
