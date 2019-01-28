extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	Input.connect("joy_connection_changed",self,"joy_con_changed")

func joy_con_changed(deviceid, isConnected):
	print ("Detecting joystick...")
	if isConnected:
		print("Joystick " +str(deviceid) +" connected")
		if Input.is_joy_known(0):
			print("Recognized controller")
			print(Input.get_joy_name(0))

func _process(delta):
	
	if Input.get_connected_joypads().size() > 0:
		for i in range(16):
			if Input.is_joy_button_pressed(0,i):
				print ("Button " + str (i) + " pressed it should be " + Input.get_joy_button_string(i) )
