extends PathFollow3D
##speed in m/s for the enemy
@export var speed:=1.0

@onready var base : Base = get_tree().get_first_node_in_group("base")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress+=speed*delta
	if progress_ratio==1.0:
		base.take_damage()
		queue_free()
