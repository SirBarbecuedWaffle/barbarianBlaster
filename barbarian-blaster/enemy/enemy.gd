extends PathFollow3D
class_name Enemy
##speed in m/s for the enemy
@export var speed:=1.0
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var health:int = 50:
	set(new_health):
		if health>new_health:
			animation_player.play("hurt")
		health=new_health
		if health<1:
			queue_free()
@export var max_health:=50
@onready var base : Base = get_tree().get_first_node_in_group("base")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress+=speed*delta
	if progress_ratio==1.0:
		base.take_damage()
		queue_free()
