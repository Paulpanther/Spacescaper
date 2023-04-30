extends Node3D

const SPAWN_RANDOM := 5.0

var players = {}

func _ready():
	
	send_username()
	
	if not multiplayer.is_server():
		return

	multiplayer.peer_connected.connect(add_player)
	multiplayer.peer_disconnected.connect(del_player)

	# Spawn already connected players
	for id in multiplayer.get_peers():
		add_player(id)

func send_username():
	rpc("on_player", Global.username)

func _exit_tree():
	if not multiplayer.is_server():
		return
	multiplayer.peer_connected.disconnect(add_player)
	multiplayer.peer_disconnected.disconnect(del_player)


func add_player(id: int):
	var all =  Global.players + [{"id": multiplayer.get_unique_id(), "username": Global.username}]
	var allWithoutId = all.filter(func(it): return it["id"] != id)
	rpc_id(id, "on_players", allWithoutId)

@rpc("any_peer")
func on_players(players):
	Global.players = players
	print(Global.username, " Add players: ", players)
	$player/UI/Comms.update_players()

@rpc("any_peer")
func on_player(username: String):
	if not multiplayer.is_server():
		return
		
	var id = multiplayer.get_remote_sender_id()
	Global.players.append({"id": id, "username": username})
	
	for other in multiplayer.get_peers():
		if other != id:
			add_player(other)
	
	print(Global.username, " Add player: ", username)
	$player/UI/Comms.update_players()

func del_player(id: int):
	pass
