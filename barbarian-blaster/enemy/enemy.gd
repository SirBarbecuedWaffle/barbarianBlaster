extends PathFollow3D
class_name Enemy
##speed in m/s for the enemy
@onready var hurt_highlight: MeshInstance3D = $hurtHighlight
@onready var bankRef=get_tree().get_first_node_in_group("bank")
@export var speed:=8.0
@export var defeatedGold:=10
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var health:int = 10:
	set(new_health):
		if health>new_health:
			animation_player.play("hurt")
		health=new_health
		if health<1:
			queue_free()
			bankRef.gold+=defeatedGold
@export var max_health:int
@onready var base : Base = get_tree().get_first_node_in_group("base")

func _ready() -> void:
	health=max_health

func _process(delta: float) -> void:
	progress+=speed*delta
	if progress_ratio==1.0:
		base.take_damage()
		queue_free()
