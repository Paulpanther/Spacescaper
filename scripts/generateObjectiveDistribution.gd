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
	
func createPlanetData():
	var player_infos = range(numplayers)
	var player_planets = range(numplayers)
	
	colors.shuffle()
	var beacon_colors = colors.slice(0, symbols.size())
	var remaining_colors = colors.slice(symbols.size())
	var next_color = 0
	
	for i in range(numplayers):
		player_infos[i] = {
			"beacon": 0,
			"symbol": 0,
			"passw": 0
		}
		
		var bucket = range(symbols.size())
		var bucketCopy = bucket.duplicate()
		for n in range(i):
			bucketCopy.erase(player_infos[n]["beacon"])
		
		var symbolIndex = pickRandom(bucketCopy)
		player_infos[i]["beacon"] = symbolIndex
		bucket.erase(symbolIndex)
		
	
		bucketCopy = bucket.duplicate()
		for n in range(i):
			bucketCopy.erase(player_infos[n]["passw"])
		
		symbolIndex = pickRandom(bucketCopy)
		player_infos[i]["passw"] = symbolIndex
		bucket.erase(symbolIndex)
		
		bucketCopy = bucket.duplicate()
		for n in range(i):
			bucketCopy.erase(player_infos[n]["symbol"])
		
		symbolIndex = pickRandom(bucketCopy)
		player_infos[i]["symbol"] = symbolIndex
		bucket.erase(symbolIndex)

		var beacon_i = randi_range(0, 1)
		var planets = [
			{
				"type": "passw",
				"passw": passwords[player_infos[i]["passw"]],
				"symbol": symbols[player_infos[i]["passw"]],
				"is_beacon": beacon_i == 0,
				"beacon_passw": passwords[player_infos[i]["beacon"]] if beacon_i == 0 else "",
				"color": beacon_colors[player_infos[i]["beacon"]] if beacon_i == 0 else remaining_colors[next_color]
			},
			{
				"type": "symbol",
				"symbol": symbols[player_infos[i]["symbol"]],
				"symbol_color": beacon_colors[player_infos[i]["symbol"]],
				"is_beacon": beacon_i == 1,
				"beacon_passw": passwords[player_infos[i]["beacon"]] if beacon_i == 1 else "",
				"color": beacon_colors[player_infos[i]["beacon"]] if beacon_i == 1 else remaining_colors[next_color+1]
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
