extends TextureRect

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var scrollSpeed = 1

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	var rectX = rect_position.x - scrollSpeed
	var rectY =  rect_position.y
	rect_position -= Vector2(rectX,rectY)
	print ("Moving bg : " +str(rectX))
	pass
