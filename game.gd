extends Node

@export var enemy_scene: PackedScene

func _ready():
	new_game()
	
func new_game():
	$EnemyTimer.start()

func game_over():
	$Player.stop()
	$BGM.stop()
	$DeathSound.play()
	$EnemyTimer.stop()
	get_tree().call_group("enemies", "stop")
	
	await get_tree().create_timer(1.5).timeout
	
	SceneSwitcher.switch_scene("res://menu.tscn")

func _on_enemy_timer_timeout() -> void:
	var enemy = enemy_scene.instantiate()
	
	var location = $LeftSpawnLocation if randi() % 2 == 0 else $RightSpawnLocation 
	enemy.position = location.position
	enemy.speed = 200 if randi() % 2 else 100
	
	enemy.turn($Player.global_position.x < enemy.global_position.x)
	
	add_child(enemy)
	
	$EnemyTimer.start(randf_range(.5,2))

func _on_player_hit_by_enemy() -> void:
	game_over()

func _on_player_hit(enemy: Node2D) -> void:
	$HitSound.play()
	enemy.death()
