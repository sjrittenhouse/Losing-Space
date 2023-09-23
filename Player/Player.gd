extends CharacterBody2D

@export var speed = 25;

func _physics_process(delta):
	velocity.x = 0
	velocity.y = 0
	
	if Input.is_key_pressed(KEY_UP):
		velocity.y -= 1
		$AnimatedSprite2D.play("Up")
		
	if Input.is_key_pressed(KEY_DOWN):
		velocity.y += 1
		$AnimatedSprite2D.play("Down")
		
	if Input.is_key_pressed(KEY_LEFT):
		velocity.x -= 1
		$AnimatedSprite2D.play("Left")
	
	if Input.is_key_pressed(KEY_RIGHT):
		velocity.x += 1
		$AnimatedSprite2D.play("Right")
	
	velocity = velocity.normalized()
	velocity *= speed
	
	move_and_slide()
	if velocity == Vector2.ZERO:
		$AnimatedSprite2D.stop()
