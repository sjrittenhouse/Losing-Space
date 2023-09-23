extends Node2D


@onready var next_scene = preload("res://main.tscn").instantiate()
@onready var timer = $Timer
var allow_move_on = false

func _process(delta):
	if allow_move_on:
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene_to_file("res://main.tscn")
			get_parent().remove_child(self)


func _on_timer_timeout():
	allow_move_on = true
