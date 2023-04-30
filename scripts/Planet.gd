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
@export var display_tag: String

var scales = [100, 100]


func _ready():
	var s = randf_range(scales[0], scales[1])
	scale = Vector3(1,1,1)*s
	
	
	var shadernames = shaders.keys()
	var shader = shadernames[randi_range(0,shadernames.size()-1)]
	
	var configs = shaders[shader]
	var config = configs[randi_range(0,configs.size()-1)]
	
	#for param in config:
	#	var value = config[param]
	#	$MeshInstance3D.get_active_material(0).set_shader(shader)
	#	$MeshInstance3D.get_active_material(0).set_shader_parameter(param,value)

func _process(delta):
	var label: Label3D = get_node("DisplayTag")
	label.text = display_tag + "\n(" + str(_calc_distance_to_player()) + "m )"
	update_pos()

func update_pos():
	var current_offset = offset + (Time.get_ticks_msec()/1000.0) * (speed / distance)
	var x = sin(current_offset) * distance
	var z = cos(current_offset) * distance

	position.x = x
	position.z = z

func _calc_distance_to_player():
	return int(get_viewport().get_camera_3d().global_position.distance_to(global_position)) 


func _on_body_entered(body):
	pass
	#if body.is_in_group("player"):
	#	body.open_dialog()
