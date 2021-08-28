extends RigidBody2D


export var speed = 1
export var border = 10000


func _ready():
	scale *= mass

func _process(delta):
	# Movement
	var mouse_position = get_global_mouse_position()
	var heading = mouse_position - position
	if self.is_visible(): 
		position += heading * speed * delta
	rotation += get_local_mouse_position().angle() * 0.1
	position.x = clamp(position.x, 0, border)
	position.y = clamp(position.y, 0, border)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
