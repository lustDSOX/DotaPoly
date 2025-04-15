extends RigidBody3D

var stotted = false

func _ready():
	var random_rotation = Vector3(
		randf_range(0, 2 * PI),
		randf_range(0, 2 * PI),
		randf_range(0, 2 * PI)
		)
	rotation = random_rotation

func _integrate_forces(state):
	if angular_velocity.length() < 0.01 and not stotted:
		var up_vector = Vector3.UP
		var closest_face = get_closest_face(up_vector)
		
		print("Выпало число: ", closest_face)

func get_closest_face(up_vector: Vector3) -> int:
	var faces = {
		4: Vector3.FORWARD,
		5: Vector3.LEFT,
		6: Vector3.UP,
		1: Vector3.DOWN,
		2: Vector3.RIGHT,
		3: Vector3.BACK,
		}
	var closest_face = "1"
	var max_dot = -1
	for face in faces:
		var global_normal = transform.basis * faces[face]
		var dot = global_normal.dot(up_vector)
		if dot > max_dot:
			max_dot = dot
			closest_face = face
	stotted = true
	return int(closest_face)
