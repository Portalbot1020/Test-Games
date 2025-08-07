extends Node2D



func _process(delta):
	var tama = get_viewport_rect().size
	position.x = wrapf(position.x, 0, tama.x)
	position.y = wrapf(position.y, 0, tama.y)
