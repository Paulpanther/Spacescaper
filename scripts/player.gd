extends RigidBody3D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	if event.is_action_pressed("forwards"):
		apply_central_impulse(Vector3(0, 0, 1) * -transform.basis.z)
	elif event.is_action_pressed("backwards"):
		apply_central_impulse(Vector3(0, 0, -1) * -transform.basis.z)
	elif event.is_action_pressed("rot_left"):
		apply_torque_impulse(Vector3(0, 0.1, 0))
	elif event.is_action_pressed("rot_right"):
		apply_torque_impulse(Vector3(0, -0.1, 0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
