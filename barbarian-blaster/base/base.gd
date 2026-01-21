extends Node3D
class_name Base
@onready var label_3d: Label3D = $Label3D
@export var maxHealth:=5.0
var health:=0.0
func _ready() -> void:
	health=maxHealth
	label_3d.text=str(int(health))+"/"+str(int(maxHealth))
	label_3d.modulate=Color("white")
	
func take_damage()->void:
	print("damage taken by base")
	set_health(health-1)

func set_health(new_health : int)->void:
	health=new_health
	label_3d.text=str(int(health))+"/"+str(int(maxHealth))
	var red=Color.RED
	var white=Color.WHITE
	label_3d.modulate=red.lerp(white,(health/maxHealth))
	if health<1:
		get_tree().reload_current_scene()
