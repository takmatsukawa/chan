extends RigidBody2D

@export var speed: float = 200.0

enum Direction {
	RIGHT,
	LEFT
}

var direction: Direction = Direction.RIGHT

func turn(dir: Direction) -> void:
	direction = dir
	$AnimatedSprite2D.flip_h = direction == Direction.LEFT

func start_animation() -> void:
	$AnimatedSprite2D.play()
	
func stop() -> void:
	$AnimatedSprite2D.stop()
	linear_velocity = Vector2.ZERO
	speed = 0
	
func _ready():
	linear_velocity = Vector2(speed * (1 if direction == Direction.RIGHT else -1), 0)

func _integrate_forces(state):
	# 速度を一定に保つ
	state.linear_velocity = Vector2(speed * (1 if direction == Direction.RIGHT else -1), 0)
