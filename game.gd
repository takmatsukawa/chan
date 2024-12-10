extends Node

@export var enemy_scene: PackedScene

func _ready():
	new_game()
	
func game_over():
	$EnemyTimer.stop()
	
func new_game():
	$EnemyTimer.start()

func _on_enemy_timer_timeout() -> void:
	var enemy = enemy_scene.instantiate()
	
	var location = $LeftSpawnLocation if randi() % 2 == 0 else $RightSpawnLocation 
	enemy.position = location.position
	
	enemy.turn($Player.global_position.x < enemy.global_position.x)

	enemy.start_animation()
	
	add_child(enemy)
