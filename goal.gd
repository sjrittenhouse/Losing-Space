extends Node2D


@onready var boxSpawner = get_node("/root/Main/SpawnList")
@onready var gameTimer = $"../../Timer"

func _ready():
	print(boxSpawner)

func _on_area_2d_body_entered(body):
	if body.get_name() == "Player":
		boxSpawner.levelUp()
		self.name = "NotGoal"
		boxSpawner.makeLevel(10)
		var currentTime = gameTimer.get_time_left()
		gameTimer.set_wait_time(currentTime + 5)
		gameTimer.start()
		self.queue_free()
	else:
		body.queue_free() # Replace with function body.
