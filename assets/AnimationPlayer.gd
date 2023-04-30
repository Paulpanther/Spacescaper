extends AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	stop()

func _input(event):
	if(event.as_text() == "L"):
		play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
