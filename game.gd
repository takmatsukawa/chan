extends Node

@export var enemy_scene: PackedScene

func _ready():
	new_game()
	
func new_game():
	$EnemyTimer.start()

func game_over():
	$DeathSound.play()
	$EnemyTimer.stop()
	get_tree().call_group("enemies", "stop")

func _on_enemy_timer_timeout() -> void:
	var enemy = enemy_scene.instantiate()
	
	var location = $LeftSpawnLocation if randi() % 2 == 0 else $RightSpawnLocation 
	enemy.position = location.position
	
	enemy.turn($Player.global_position.x < enemy.global_position.x)

	enemy.start_animation()
	
	add_child(enemy)


func _on_player_hit() -> void:
	game_over()
