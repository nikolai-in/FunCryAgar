extends RigidBody2D


export var speed = 1
var world_scale = 3
var screen_size : Vector2


func _ready() -> void:
	hide()
	screen_size = get_viewport_rect().size


func _process(delta: float) -> void:
	var mouse_position : Vector2 = get_global_mouse_position()
	var heading : Vector2 = mouse_position - position
	
	if visible:
		position += heading * speed * delta
	rotation += get_local_mouse_position().angle() * 0.1
	
	position.x = clamp(position.x, -screen_size.x * world_scale,
	 screen_size.x * world_scale)
	position.y = clamp(position.y, -screen_size.y * world_scale,
	 screen_size.y * world_scale)


func start(pos: Vector2):
	position = pos
	show()
	$CollisionShape2D.disabled = false


func stop() -> void:
	hide()
	$CollisionShape2D.set_deferred("disabled",true)


func _on_Player_body_entered(body: Node) -> void:
	print(body.name)
