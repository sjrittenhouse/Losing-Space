extends Node2D


var allow_move_on = false

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://tutorial.tscn")
		get_parent().remove_child(self)

