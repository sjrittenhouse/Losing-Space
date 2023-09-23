extends Node2D

var goal : Node2D
var goalLocation
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	goal = get_node("../../SpawnList/Goal")
	
	if goal == null:
		goalLocation = self.global_position
	else:
		goalLocation = goal.global_position
	self.look_at(goalLocation)
	
