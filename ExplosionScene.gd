extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	get_node("AnimationPlayer").play("ZoomIn")
	yield($AnimationPlayer,"animation_finished")
	$Sprite/Particles2D.emitting = false
	$ExplosionSound.play()
	$Sprite.play("Explosion")
	yield($ExplosionSound,"finished")
	
	queue_free()
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
