extends RigidBody2D

@export var speed: float = 200.0

enum Direction {
	RIGHT,
	LEFT
}

enum State {
	WALKING,
	DYING
}

var direction: Direction = Direction.LEFT
var state: State = State.WALKING

func turn(dir: Direction) -> void:
	direction = dir
	$AnimatedSprite2D.flip_h = direction == Direction.LEFT

func stop() -> void:
	$AnimatedSprite2D.pause()
	linear_velocity = Vector2.ZERO
	speed = 0
	
func _ready():
	linear_velocity = Vector2(speed * (1 if direction == Direction.RIGHT else -1), 0)
	$AnimatedSprite2D.play()

func _integrate_forces(s):
	if (state == State.WALKING):
		# 速度を一定に保つ
		s.linear_velocity = Vector2(speed * (1 if direction == Direction.RIGHT else -1), 0)
		
func death():
	if (state != State.DYING):
		state = State.DYING
		$CollisionShape2D.set_deferred("disabled", true)
		$AnimatedSprite2D.pause()
		gravity_scale = 4
		apply_central_impulse(Vector2(0, -1000))
		await get_tree().create_timer(2).timeout
		queue_free()

func is_dying() -> bool:
	return state == State.DYING
