extends MeshInstance3D

@export var bla: float = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	get_active_material(0).set_shader_parameter("bla",bla)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
