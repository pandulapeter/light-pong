extends CharacterBody3D

@export var color: Color = Color.WHITE
var speed = 20
const TOP_LIMIT = -2
const BOTTOM_LIMIT = 4.9

func _ready():
	var material = StandardMaterial3D.new()
	material.albedo_color = color
	$Mesh.set_surface_override_material(0, material)

func move_up(delta):
	if global_position.z > TOP_LIMIT:
		global_position.z -= speed * delta
	if global_position.z <= TOP_LIMIT:
		global_position.z = TOP_LIMIT

func move_down(delta):
	if global_position.z < BOTTOM_LIMIT:
		global_position.z += speed * delta
	if global_position.z >= BOTTOM_LIMIT:
		global_position.z = BOTTOM_LIMIT
