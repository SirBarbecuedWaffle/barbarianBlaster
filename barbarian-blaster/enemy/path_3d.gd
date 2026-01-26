extends Path3D
@export var spawnedEnemy : PackedScene
@onready var enemy_spawn_timer: Timer = $enemySpawnTimer


func spawnEnemy()->void:
	var newEnemy=spawnedEnemy.instantiate()
	add_child(newEnemy)
	newEnemy.progress=0


func _on_enemy_spawn_timer_timeout() -> void:
	spawnEnemy()
