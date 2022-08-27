extends Node2D

export(bool) var on = true
export(Color, RGBA) var color := Color.black


func _draw():
	var camera: Camera2D = get_node(camera_path)
	if on: 
		var size = get_viewport_rect().size  * 3
		for i in range(int((cam.x - size.x) / 64) - 1, int((size.x + cam.x) / 64) + 1):
			draw_line(Vector2(i * 64, cam.y + size.y + 100), Vector2(i * 64, cam.y - size.y - 100), color)
		for i in range(int((cam.y - size.y) / 64) - 1, int((size.y + cam.y) / 64) + 1):
			draw_line(Vector2(cam.x + size.x + 100, i * 64), Vector2(cam.x - size.x - 100, i * 64), color)

func _process(delta):
	update()
