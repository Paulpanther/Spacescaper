extends RigidBody3D

@export var player := 1 :
	set(id):
		player = id
		# Give authority over the player input to the appropriate peer.
		#$PlayerInput.set_multiplayer_authority(id)

# Player synchronized input.
#@onready var input = $PlayerInput

# Called when the node enters the scene tree for the first time.
func _ready():
	#if player == multiplayer.get_unique_id():
	#	$Camera3D.current = true
	pass


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
