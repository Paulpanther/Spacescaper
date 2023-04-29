extends Node

var selectedPlayer = 0

func _ready():
	pass
	
func _process(delta):
	pass

func _on_button_1_toggled(button_pressed):
	if button_pressed:
		selectedPlayer = 0

func _on_button_2_toggled(button_pressed):
	if button_pressed:
		selectedPlayer = 1

func _on_button_3_toggled(button_pressed):
	if button_pressed:
		selectedPlayer = 2

func _on_button_4_toggled(button_pressed):
	if button_pressed:
		selectedPlayer = 3
