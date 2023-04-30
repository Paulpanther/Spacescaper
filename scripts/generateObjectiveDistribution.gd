extends Node

var colors = [
	"aqua",
	"black",
	"blue",
	"fuchsia",
	"gray",
	"green",
	"lime",
	"maroon",
	"navy",
	"olive",
	"purple",
	"red",
	"silver",
	"teal",
	"white",
	"yellow"
]

var symbols = [
	"serpent",
	"cross",
	"sun",
	#"spaceship"
]

var passwords = [
	"password123",
	"PASSWORT!",
	"uwu",
	"sendPW",
	"unknackbar12345",
	"ahhhhhh",
	"KriminellMiminell",
	"PlanetPW9000"
]

@export var numplayers : int

func pick_remove_random_entry(list):
	var randomindex = randi_range(0,list.size())
	var element = list.remove(randomindex)
	return element
	
func pick_planet_colors():
	var player_planet_lists = {}
	var num_pickable_planets = colors.size() / numplayers
	
	for i in range(numplayers):
		var planet_list = []
		for n in range(num_pickable_planets):
			planet_list.append(pick_remove_random_entry(colors))
		player_planet_lists.append(i,planet_list)
	return player_planet_lists
	
func pickRandom(list):
	var index = randi_range(0,list.size()-1)
	return	list[index]
	
func shift_list(l: Array):
	var first = l.pop_front()
	l.push_back(first)
	
func createPlanetData():
	var player_planets = range(numplayers)
	
	colors.shuffle()
	var beacon_colors = colors.slice(0, symbols.size())
	var remaining_colors = colors.slice(symbols.size())
	var next_color = 0
	
	var permutation = range(symbols.size())
	permutation.shuffle()
	
	for i in range(numplayers):
		var passw = permutation[0]
		var beacon = permutation[1]
		var symbol = permutation[2]
		
		shift_list(permutation)
		
		var beacon_i = randi_range(0, 1)
		var planets = [
			{
				"type": "passw",
				"passw": passwords[passw],
				"symbol": symbols[passw],
				"is_beacon": beacon_i == 0,
				"beacon_passw": passwords[beacon] if beacon_i == 0 else "",
				"color": beacon_colors[beacon] if beacon_i == 0 else remaining_colors[next_color]
			},
			{
				"type": "symbol",
				"symbol": symbols[symbol],
				"symbol_color": beacon_colors[symbol],
				"is_beacon": beacon_i == 1,
				"beacon_passw": passwords[beacon] if beacon_i == 1 else "",
				"color": beacon_colors[beacon] if beacon_i == 1 else remaining_colors[next_color+1]
			},
		]
		player_planets[i] = planets
		
		next_color += 2
	return player_planets


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
	
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
