extends Node2D

func _player_shoot(Bullet, direction, location):
    var spawned_bullet = Bullet.instantiate()
    add_child(spawned_bullet)
    spawned_bullet.rotation = direction
    spawned_bullet.global_position = location
    if spawned_bullet.has_method("set_direction"):
        spawned_bullet.set_direction(Vector2(0, -1).rotated(direction))