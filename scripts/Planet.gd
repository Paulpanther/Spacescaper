extends Node

@onready var shaders = {
	preload("res://shaders/poles.tres"):[
		{"bla":1},
		{"bla":0}
	]
}


func _ready():
	
	var shadernames = shaders.keys()
	var shader = shadernames[randi_range(0,shadernames.size()-1)]
	
	
	var configs = shaders[shader]
	var config = configs[randi_range(0,configs.size()-1)]
	
	for param in config:
		var value = config[param]
		$MeshInstance3D.get_active_material(0).set_shader(shader)
		$MeshInstance3D.get_active_material(0).set_shader_parameter(param,value)
	pass

func _process(delta):
	pass
