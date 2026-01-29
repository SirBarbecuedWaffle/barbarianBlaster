extends Node3D
var proj=preload("res://projectile/projectile.tscn")
@export var enemyPath : Path3D
@onready var cannon: Node3D = $turretBase/turretTop/Cannon
var target : Node3D
@export var range:=10.0
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var turret_base: Node3D = $turretBase
@onready var timer: Timer = $Timer
@onready var turret_mesh: Node3D = $turretBase/TurretMesh

func _physics_process(delta: float) -> void:
	target=find_best_target()
	if target is Enemy:
		turret_base.look_at(target.global_position,Vector3.UP,true)
	turret_base.rotation.z=0
	turret_base.rotation.x=0
func _on_timer_timeout() -> void:
	if target!=null:
		animation_player.play("fire")
		var shotproj=proj.instantiate()
		add_child(shotproj)
		shotproj.global_position=cannon.global_position
		shotproj.global_position.y=cannon.global_position.y
		shotproj.direction=cannon.global_transform.basis.z

func find_best_target()->Enemy:
	var bestEnemy : PathFollow3D = null
	for f in enemyPath.get_children():
		if f is Enemy:
			if f.global_position.distance_to(global_position)<range:
				if bestEnemy==null || f.progress>bestEnemy.progress:
					bestEnemy=f
	return bestEnemy
