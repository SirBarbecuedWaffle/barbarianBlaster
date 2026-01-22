extends Node3D
var proj=preload("res://projectile/projectile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var shotproj=proj.instantiate()
	add_child(shotproj)
	shotproj.global_position=global_position
	
