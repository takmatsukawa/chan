extends RichTextLabel

@export var next_scene:PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	modulate.a = 0
	var tween1 = get_tree().create_tween()
	tween1.tween_property(self, "modulate", Color.WHITE, .1)
	
	await get_tree().create_timer(1.5).timeout
	var tween2 = get_tree().create_tween()
	tween2.tween_property(self, "modulate", Color.TRANSPARENT, .2)

	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_packed(next_scene)
