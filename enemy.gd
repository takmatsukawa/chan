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
	
func _process(delta):
	position.x += speed * delta * (1 if direction == Direction.RIGHT else -1)
