extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var borderNode = get_tree().get_root().find_node("pf", true, false)
	borderNode.hide()
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_Timer_timeout():
	var borderNode = get_tree().get_root().find_node("pf", true, false)
	borderNode.show()
	queue_free()
