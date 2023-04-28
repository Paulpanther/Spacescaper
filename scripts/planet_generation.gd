extends Node

var planetClass = preload("res://scenes/planet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	var planet = planetClass.instantiate()
	add_child(planet)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
