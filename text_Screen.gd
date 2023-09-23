extends Node2D


@export var next_scene : Node2D
@onready var next_scene_loaded = preload(next_scene).instantiate()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_ENTER):
		
