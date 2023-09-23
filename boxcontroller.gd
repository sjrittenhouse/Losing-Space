extends Node2D


@export var wall : PackedScene
var goalScene : Node2D
var startTime
var spawnX = [-18,-36,-54,-72,-90,-108,-126,-144,-162,-180,-198,-216,-234,-252,-270,-288,-306,-324,-342,-360,-378,-396,-414,-432,-450,-468,-486,-504,-522,-540,-558,-576,-594]
var spawnY = [18,36,54,72,90,108,126,144,162,180,198,216,234,252,270,288,306,324,342,360,378,396,414,432,450,468,486,504,522]
var previousGoalToken = []
var level = 1
@export var levelDisplay : RichTextLabel
@onready var next_scene = preload("res://game_over.tscn").instantiate()

func _ready():
	Global.score = 0
	startTime = Time.get_ticks_msec()
	randomize()
	call_deferred("makeLevel",5)


func spawnLocation():
	var randXindex: int = randi() % spawnX.size()
	var randYindex: int = randi() % spawnY.size()
	
	var blockSpawnPos : Vector2
	blockSpawnPos.x = spawnX[randXindex]
	blockSpawnPos.y = spawnY[randYindex]
	
	return blockSpawnPos
	
func levelUp():
	Global.score += 1
	levelDisplay.set_text(str("Score: ", Global.score))
	
func makeLevel(spawnNumber):
	var spawnList = []
	for x in previousGoalToken:
		spawnList.append(x)
	var PlayerSpawn = $"../Player".position
	spawnList.append(PlayerSpawn)
	
	var rangelowX = PlayerSpawn.x - 10
	var rangehighX = PlayerSpawn.x + 10
	var rangelowY = PlayerSpawn.y - 10
	var rangehighY = PlayerSpawn.y + 10
	
	for x in range(rangelowX, rangehighX):
		var addX = x
		for y in range(rangelowY, rangehighY):
			var addY = y
			var add : Vector2
			add.x = addX
			add.y = addY
			spawnList.append(add)
	var goalExists = false
	for _i in self.get_children():
		if _i.name == "Goal":
			goalExists = true
	if goalExists == false:
		var spawnGoal = spawnLocation()
		var spawnGoalLoop = 0
		while spawnList.has(spawnGoal):
			spawnGoal = spawnLocation()
		previousGoalToken.append(spawnGoal)
		goalScene = preload("res://goal.tscn").instantiate()
		goalScene.position = spawnGoal
		add_child(goalScene)
	else:
		print("Goal Exists")
	for x in range(spawnNumber):
		var block = wall.instantiate()
		var spawnLocation = spawnLocation()
		while spawnList.has(spawnLocation):
			spawnLocation = spawnLocation()
		block.position = spawnLocation
		call_deferred("add_child", block)
		spawnList.append(spawnLocation)
		previousGoalToken.append(spawnLocation)

func gameOver():
	get_tree().change_scene_to_file("res://game_over.tscn")
func _on_timer_timeout():
	gameOver()
	
func _process(delta):
	var goalExists = false
	for _i in self.get_children():
		if _i.name == "Goal":
			goalExists = true
	if goalExists == false:
		makeLevel(5)
