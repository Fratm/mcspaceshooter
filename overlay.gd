extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var mainNode

func _ready():
	print ("Canvas Layer is ready!")
	mainNode = get_tree().get_root().find_node("Main", true, false)
	decRoidCount()


# All overlay updates should be handled here from now on, via variables set in the main node.
func _process(delta):
	# Update Overlay
	print ("Score : " + str(mainNode.score))
	$phaseBombs.set_text(str (mainNode.phaseBombsAvailable) )
	$Score.set_text(str (mainNode.score) )
	$Wave.set_text(str (mainNode.currentWave) )
	
#Decrement roidCounter.
func decRoidCount():
	var newCount = int ($roidCounter.get_text() )
	newCount -= 1
	$roidCounter.set_text(str(newCount) )
	

