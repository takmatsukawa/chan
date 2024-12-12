extends Area2D

@export var green_onion_scene: PackedScene

signal hit(enemy: Node2D)
signal hit_by_enemy

enum State {
	Playing,
	Stop
}

enum Direction {
	Left,
	Right,
}

var state: State
var direction: Direction

func _ready() -> void:
	state = State.Playing
	direction = Direction.Left

func _process(delta: float) -> void:
	if (state == State.Playing):
		if Input.is_action_pressed("swing_left"):
			$AnimatedSprite2D.stop()
			turnLeft()
			$AnimatedSprite2D.play()
			swingWeapon()
			
		if Input.is_action_pressed("swing_right"):
			$AnimatedSprite2D.stop()
			turnRight()
			$AnimatedSprite2D.play()
			swingWeapon()
			
func _on_body_entered(body: Node2D) -> void:
	hit_by_enemy.emit()
	
func turnLeft() -> void:
	direction = Direction.Left
	$AnimatedSprite2D.flip_h = false

func turnRight() -> void:
	direction = Direction.Right
	$AnimatedSprite2D.flip_h = true
	
func swingWeapon() -> void:
	var weapon = green_onion_scene.instantiate()
	weapon.position = Vector2(50 * (-1 if direction == Direction.Left else 1), 0)
	weapon.connect("hit", _on_green_onion_hit)
	add_child(weapon)
			
func _on_green_onion_hit(enemy: Node2D) -> void:
	hit.emit	(enemy)

func stop() -> void:
	state = State.Stop
	$AnimatedSprite2D.pause()
