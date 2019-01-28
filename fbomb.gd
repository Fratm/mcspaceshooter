extends Node2D
var fragments = preload("res://Fragment.tscn")
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	randomize()
	var fragCount = int (rand_range(10, 20) )
	for i in range(fragCount):
		var myFrag = fragments.instance()
		add_child(myFrag)
		