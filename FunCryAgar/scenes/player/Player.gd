extends RigidBody2D


export var speed = 1
var screen_size : Vector2


func _ready() -> void:
	screen_size = get_viewport_rect().size


func _process(delta: float) -> void:
	var mouse_position : Vector2 = get_global_mouse_position()
	var heading : Vector2 = mouse_position - position
	
	# if visible:
	position += heading * speed * delta
	rotation += get_local_mouse_position().angle() * 0.1
	
	position.x = clamp(position.x, -screen_size.x, screen_size.x * 2)
	position.y = clamp(position.y, -screen_size.y, screen_size.y * 2)
	
