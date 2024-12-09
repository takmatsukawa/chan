extends Area2D


func _process(delta: float) -> void:
	if Input.is_action_pressed("swing_left"):
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play()
		
	if Input.is_action_pressed("swing_right"):
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play()
