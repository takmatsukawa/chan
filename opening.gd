extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Title.modulate.a = 0
	var tween1 = get_tree().create_tween()
	tween1.tween_property($Title, "modulate", Color.WHITE, .1)
	
	await get_tree().create_timer(1.5).timeout
	
	var tween2 = get_tree().create_tween()
	tween2.tween_property($Title, "modulate", Color.TRANSPARENT, .2)

	await get_tree().create_timer(1).timeout

	SceneSwitcher.switch_scene("res://menu.tscn")
