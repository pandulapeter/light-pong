extends RigidBody3D

signal ball_lost

@export var initial_speed = 10
@export var bounce_multiplier = 2
@export var speed_increment = 1
var direction = Vector3.LEFT
var start_position: Vector3
var speed

func _ready():
	start_position = global_position
	randomize_direction()
	speed = initial_speed

func _physics_process(delta):
	if global_position.x < -16 || global_position.x > 16 || global_position.y < -4:
		ball_lost.emit(is_going_left())
		global_position = start_position
		randomize_direction()
		speed = initial_speed
	else:
		global_position += delta * speed * direction
		speed += speed_increment * delta

func _on_body_entered(body):
	if body.is_in_group("walls"):
		if global_position.z < 0:
			direction = direction.reflect(Vector3.LEFT)
		else:
			direction = direction.reflect(Vector3.RIGHT)
	if body is CharacterBody3D:
		var collision_direction = global_position.direction_to(body.global_position)
		direction = -collision_direction

func randomize_direction():
	if is_going_left():
		direction = Vector3.LEFT
	else:
		direction = Vector3.RIGHT
	direction = direction.rotated(Vector3.UP, randf_range(-PI / 4, PI / 4))

func is_going_left():
	return direction.distance_to(Vector3.LEFT) > direction.distance_to(Vector3.RIGHT)
