extends Node

var planet_names = ["Pluto", "Dwarf", "Leo", "Bernd", "Bernd the Planet", "Hasel", "Gatos", "Mordor", "Gondor", "[object Object]", "Rolf", "Und Danke!", "Hera", "Ceres", "Hades", "Ares", "Poseidon", "S.A. Corey", "Proto-M", "Leviathan"]
var distancerange = [1000,6000]
var mindistance = 1000
var num_planets = [2,10]
var speeds = [10, 300]
var planetClass = preload("res://scenes/planet.tscn")

func _ready():
	var planets = randi_range(num_planets[0],num_planets[1])
	var totalDist = mindistance
	planet_names.shuffle()
	for i in range(planets):
		var distance = randi_range(distancerange[0],distancerange[1])
		totalDist += distance
		var planet = planetClass.instantiate()
		var circlePos = randi_range(0,PI*2)
		planet.offset = circlePos
		planet.distance = totalDist
		planet.speed = randf_range(speeds[0], speeds[1])
		planet.display_tag = planet_names[i]
		planet.update_pos()
		add_child(planet)
