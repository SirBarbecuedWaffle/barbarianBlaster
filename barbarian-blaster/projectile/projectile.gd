extends Area3D
@export var speed :=50.0
var direction=Vector3.FORWARD
func _physics_process(delta: float) -> void:
	direction.y=0
	position+=direction*speed*delta

func _on_timer_timeout() -> void:
	queue_free()


func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("enemy_area"):
		area.get_parent().health-=25
		print(area.get_parent().health)
		queue_free()
