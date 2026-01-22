extends Node3D
class_name TurretManager
@export var turret : PackedScene

func build_turret(pos : Vector3)->void:
	var newtur=turret.instantiate()
	add_child(newtur)
	newtur.global_position=pos
	
