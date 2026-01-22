extends Camera3D
@onready var ray_cast_3d: RayCast3D = $RayCast3D
@export var gridMap : GridMap
@export var turretManager : TurretManager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Input.set_default_cursor_shape(Input.CURSOR_FORBIDDEN)
	var mousePos : Vector2=get_viewport().get_mouse_position()
	ray_cast_3d.target_position=project_local_ray_normal(mousePos)*100.0
	ray_cast_3d.force_raycast_update()
	if ray_cast_3d.is_colliding():
		var collider=ray_cast_3d.get_collider()
		if collider is GridMap:
			var colPoint=ray_cast_3d.get_collision_point()
			var cell=gridMap.local_to_map(colPoint)
			if gridMap.get_cell_item(cell)==0:
				if Input.is_action_just_pressed("click"):
					gridMap.set_cell_item(cell,1)
					turretManager.build_turret(gridMap.map_to_local(cell))
				Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
