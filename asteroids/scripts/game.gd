extends Node2D

func _physics_process(_delta):
	var viewport_size = get_viewport_rect().size
	var player = $Player
	var camera = $Camera2D
	
	if player and camera:
		# Get sprite size for offset calculations
		var sprite = player.get_node("Sprite2D")
		var sprite_width = 0
		var sprite_height = 0
		if sprite and sprite.texture:
			sprite_width = sprite.texture.get_width() * sprite.scale.x
			sprite_height = sprite.texture.get_height() * sprite.scale.y
		
		# Account for camera zoom
		var actual_width = viewport_size.x / camera.zoom.x
		var actual_height = viewport_size.y / camera.zoom.y
		
		# Center the wrapping around camera position
		var left = camera.global_position.x - actual_width/2
		var right = camera.global_position.x + actual_width/2
		var top = camera.global_position.y - actual_height/2
		var bottom = camera.global_position.y + actual_height/2
		
		# Wrap position (accounting for sprite size)
		if player.global_position.x < left - sprite_width:
			player.global_position.x = right + sprite_width/2
		elif player.global_position.x > right + sprite_width:
			player.global_position.x = left - sprite_width/2
			
		if player.global_position.y < top - sprite_height:
			player.global_position.y = bottom + sprite_height/2
		elif player.global_position.y > bottom + sprite_height:
			player.global_position.y = top - sprite_height/2
