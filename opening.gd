extends Node

func _ready() -> void:
	$Title.modulate.a = 0
	var tween = create_tween()
	tween.tween_property($Title, "modulate", Color.WHITE, .1)
	tween.tween_interval(1.5)
	tween.tween_property($Title, "modulate", Color.TRANSPARENT, .2)
	await tween.tween_interval(1).finished
	
	SceneSwitcher.switch_scene("res://menu.tscn")
