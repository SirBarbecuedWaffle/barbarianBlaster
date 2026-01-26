extends Node3D
class_name TurretManager
@export var turret : PackedScene
@export var pathe: Path3D
func build_turret(pos : Vector3)->void:
	var newtur=turret.instantiate()
	add_child(newtur)
	newtur.enemyPath=pathe
	newtur.global_position=pos
	
