extends Area2D

@export var width = 50
@export var height = 500
@export var expandDuration = .1

signal hit(enemy: Node2D)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CollisionShape2D.shape.size = Vector2(1, height)

	var tween = get_tree().create_tween()
	tween.tween_property($CollisionShape2D, "shape:size", Vector2(width, height), expandDuration)
	await tween.tween_property($CollisionShape2D, "shape:size", Vector2(1, height), expandDuration).finished
	
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	hit.emit(body)
