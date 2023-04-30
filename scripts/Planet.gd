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

@export var color: Color
@export var type: String
@export var symbol: String
@export var symbol_color: Color
@export var passw: String
@export var passw_symbol: String
@export var is_beacon: bool
@export var beacon_passw: String
	

var scales = [100, 100]


func _ready():
	var s = randf_range(scales[0], scales[1])
	scale = Vector3(1,1,1)*s
	
	$planet_beacon.color = color
	$planet_beacon2.color = color
	$planet_beacon3.color = color
	$planet_beacon4.color = color
	$planet_beacon5.color = color
	$planet_beacon6.color = color
	$planet_beacon7.color = color
	$planet_beacon8.color = color
	
	
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
