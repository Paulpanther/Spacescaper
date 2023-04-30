extends Node3D

var color: Vector3

func _ready():
	get_node("Torus/Cube001/Cube/Sphere").get_active_material(0).set_shader_parameter("color", Color8(255,0,0))
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
