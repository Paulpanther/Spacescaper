extends MeshInstance3D

@export var bla: float = 1


func _ready():
	get_active_material(0).set_shader_parameter("bla",bla)


func _process(delta):
	pass
