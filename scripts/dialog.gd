extends Control


func _ready():
	hide()


func open_dialog():
	get_tree().paused = true
	show()


func _on_close_pressed():
	hide()
	get_tree().paused = false
