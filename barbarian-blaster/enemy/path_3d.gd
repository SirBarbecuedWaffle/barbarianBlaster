extends Path3D
@export var spawnedEnemy : PackedScene
@onready var enemy_spawn_timer: Timer = $enemySpawnTimer
@export var difficultyManager:Node
@export var victoryLayer : CanvasLayer

func spawnEnemy()->void:
	var newEnemy=spawnedEnemy.instantiate()
	newEnemy.progress=0
	newEnemy.max_health=difficultyManager.get_enemy_health()
	add_child(newEnemy)
	newEnemy.tree_exited.connect(enemy_defeated)
	enemy_spawn_timer.wait_time=difficultyManager.get_spawn_time()


func _on_enemy_spawn_timer_timeout() -> void:
	spawnEnemy()


func _on_difficulty_manager_stop_spawning_enemies() -> void:
	enemy_spawn_timer.stop()

func enemy_defeated()->void:
	if enemy_spawn_timer.is_stopped():
		for ene in get_children():
			if ene is Enemy:
				return
		victoryLayer.visible=true
