extends Node

var distancerange = [5,10]
var mindistance = 0
var num_planets = [2,10]
var speeds = [10, 10]
var planetClass = preload("res://scenes/planet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	var planets = randi_range(num_planets[0],num_planets[1])
	var totalDist = mindistance
	for i in range(planets):
		var distance = randi_range(distancerange[0],distancerange[1])
		totalDist += distance
		var planet = planetClass.instantiate()
		var circlePos = randi_range(0,PI*2)
		planet.offset = circlePos
		planet.distance = totalDist
		planet.speed = randf_range(speeds[0], speeds[1])
		add_child(planet)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
