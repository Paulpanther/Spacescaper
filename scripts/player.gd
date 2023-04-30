extends RigidBody3D

@export var linear_thruster_strength = 60.0
@export var rotational_thruster_strength = 1.0

func _ready():
	pass

func _physics_process(delta):
	var linear = Vector3(
		(Input.get_action_strength("right") - Input.get_action_strength("left")) * delta * linear_thruster_strength,
		(Input.get_action_strength("up") - Input.get_action_strength("down")) * delta * linear_thruster_strength,
		(Input.get_action_strength("backward") - Input.get_action_strength("forward")) * delta * linear_thruster_strength,
	)
	
	#(Input.get_action_strength("roll_left") - Input.get_action_strength("roll_right")) * delta * rotational_thruster_strength
	
	apply_central_impulse(-transform.basis.z * (Input.get_action_strength("backward") - Input.get_action_strength("forward")) * delta * linear_thruster_strength)
	apply_torque_impulse(transform.basis.y * (Input.get_action_strength("yaw_left") - Input.get_action_strength("yaw_right")) * delta * rotational_thruster_strength)
	#apply_torque_impulse(transform.basis.x * (Input.get_action_strength("pitch_down") - Input.get_action_strength("pitch_up")) * delta * rotational_thruster_strength)

func open_dialog():
	$UI/VBox/PlanetDialog.open_dialog()
