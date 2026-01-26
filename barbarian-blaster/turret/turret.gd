extends Node3D
var proj=preload("res://projectile/projectile.tscn")
@export var enemyPath : Path3D
var target : Node3D
@export var range:=10.0

func _physics_process(delta: float) -> void:
	target=find_best_target()
	if target is Enemy:
		look_at(target.global_position,Vector3.UP,true)
func _on_timer_timeout() -> void:
	if target!=null:
		var shotproj=proj.instantiate()
		add_child(shotproj)
		shotproj.global_position=global_position
		shotproj.global_position.y=global_position.y+1.8
		shotproj.direction=global_transform.basis.z

func find_best_target()->Enemy:
	var bestEnemy : PathFollow3D = null
	for f in enemyPath.get_children():
		if f.global_position.distance_to(global_position)<range && f is Enemy:
			if bestEnemy==null || f.progress>bestEnemy.progress:
				bestEnemy=f
	return bestEnemy
