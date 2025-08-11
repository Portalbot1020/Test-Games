extends RigidBody2D

var thrust = Vector2(0, -250)
var torque = 1500
var can_shoot = true
var shoot_cooldown = 0.05
var Bullet = preload("res://scenes/bullet.tscn")

func _integrate_forces(state):
	if Input.is_action_pressed("ui_up"):
		state.apply_central_force(thrust.rotated(rotation))
	else:
		state.apply_force(Vector2())
	var rotation_direction = 0
	if Input.is_action_pressed("ui_right"):
		rotation_direction += 1
	if Input.is_action_pressed("ui_left"):
		rotation_direction -= 1
	state.apply_torque(rotation_direction * torque)

func _input(event):
	if event.is_action_pressed("player_shoot") and can_shoot:
		shoot_bullet()
		can_shoot = false
		await get_tree().create_timer(shoot_cooldown).timeout
		can_shoot = true

func shoot_bullet():
	var bullet = Bullet.instantiate()
	var direction = Vector2(0, -1).rotated(rotation)
	get_tree().current_scene.add_child(bullet)
	bullet.global_position = global_position + direction * 20
	bullet.rotation = rotation
	bullet.set_direction(direction)