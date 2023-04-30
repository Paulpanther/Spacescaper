extends Node3D

@export var color: Color

func _ready():
	get_node("Torus/Cube001/Cube/Sphere").get_active_material(0).set_shader_parameter("color", color)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
