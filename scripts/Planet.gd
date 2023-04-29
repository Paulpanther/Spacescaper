extends Node3D

@onready var shaders = {
	preload("res://shaders/poles.tres"):[
		{"bla":1},
		{"bla":0}
	]
}

@export var speed: float
@export var distance: float
@export var offset: float  

var scales = [1, 5]


func _ready():
	var s = randf_range(scales[0], scales[1])
	scale.x = s
	scale.y = s
	scale.z = s
	
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
	var current_offset = offset + Time.get_ticks_msec()/1000.0 * speed / distance
	var x = sin(current_offset)*distance
	var z = cos(current_offset)*distance
		
	position.x = x
	position.z = z
