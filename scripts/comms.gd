extends Node

var selectedPlayer = 0

var last_remove_time = 0
var remove_duration = 1

@onready 
var player_uis = [
	{
		"button": $Input/Button1,
		"output": $Output/Players/Player1,
		"id": 0
	},
	{
		"button": $Input/Button2,
		"output": $Output/Players/Player2,
		"id": 0
	},
	{
		"button": $Input/Button3,
		"output": $Output/Players/Player3,
		"id": 0
	}
]

func _ready():
	$Player/Label.text = "Your name: " + Global.username
	update_players()
	
func _input(event):
	if event is InputEventKey and event.is_pressed():
		var c = char(event.unicode)
		
		if event.unicode > 33 && event.unicode != 127:
			$Input/Chat.text += c
		elif event.unicode == 32:
			$Input/Chat.text += " "
	
func _process(delta):
	var s = Time.get_ticks_msec() / 1000.0
	if s - last_remove_time > remove_duration:
		last_remove_time = s
		var inp = $Input/Chat
		if inp.text == "":
			return
		
		var c = inp.text[0]
		rpc("on_char", player_uis[selectedPlayer]["id"], multiplayer.get_unique_id(), c)
		inp.text = inp.text.substr(1)

@rpc("any_peer")
func on_char(id: int, from: int, c: String):
	if id != multiplayer.get_unique_id():
		if multiplayer.is_server():
			rpc("on_char", id, from, c)
		return
			
	var ui = player_uis.filter(func(ui): return ui["id"] == from)
	if ui.size() == 0: return
	ui[0]["output"].get_node("Text").text += c

func update_players():
	var players = Global.players
	
	for i in range(3):
		hide_player_ui(i)
	
	for i in range(players.size()):
		show_player_ui(i)
		var player = players[i]
		player_uis[i]["button"].text = player["username"]
		player_uis[i]["output"].get_node("Label").text = player["username"] + ": "
		player_uis[i]["id"] = player["id"]


func show_player_ui(i):
	var ui = player_uis[i]
	ui["button"].show()
	ui["output"].show()
	
func hide_player_ui(i):
	var ui = player_uis[i]
	ui["button"].hide()
	ui["output"].hide()

func _on_button_1_toggled(button_pressed):
	if button_pressed:
		selectedPlayer = 0

func _on_button_2_toggled(button_pressed):
	if button_pressed:
		selectedPlayer = 1

func _on_button_3_toggled(button_pressed):
	if button_pressed:
		selectedPlayer = 2
