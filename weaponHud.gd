extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var selectedItem = 1

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func _input(event):
	#Check for wheel up.
	if event.is_action_pressed("wheel_down"):
		selectedItem += 1
		if selectedItem >4:
			selectedItem = 1
		updateHud()
	elif event.is_action_pressed("wheel_up"):
		selectedItem -= 1
		if selectedItem <1:
			selectedItem = 4
		updateHud()
	
	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func updateHud():
	
	if selectedItem == 1:
		$itemOne.texture = load("res://assets/weaponHud/hudSelectBoxSelected.png")
	else:
		$itemOne.texture = load("res://assets/weaponHud/hudSelectBoxNotSelected.png")
	if selectedItem == 2:
		$itemTwo.texture = load("res://assets/weaponHud/hudSelectBoxSelected.png")
	else:
		$itemTwo.texture = load("res://assets/weaponHud/hudSelectBoxNotSelected.png")
	if selectedItem == 3:
		$itemThree.texture = load("res://assets/weaponHud/hudSelectBoxSelected.png")
	else:
		$itemThree.texture = load("res://assets/weaponHud/hudSelectBoxNotSelected.png")
	if selectedItem == 4:
		$itemFour.texture = load("res://assets/weaponHud/hudSelectBoxSelected.png")
	else:
		$itemFour.texture = load("res://assets/weaponHud/hudSelectBoxNotSelected.png")
	
