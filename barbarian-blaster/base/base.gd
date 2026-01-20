extends Node3D
class_name Base
@onready var label_3d: Label3D = $Label3D
@export var maxHealth:=5
var health:=0
func _ready() -> void:
	health=maxHealth
	label_3d.text=str(health)+"/"+str(maxHealth)
	
func take_damage()->void:
	print("damage taken by base")
	set_health(health-1)

func set_health(new_health : int)->void:
	health=new_health
	label_3d.text=str(health)+"/"+str(maxHealth)
	if health<0:
		get_tree().reload_current_scene()
