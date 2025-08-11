extends Area2D

var speed = 500
var velocity = Vector2.ZERO
var lifetime = 2.0

func _ready() -> void:
	visible = false  # Hide by default
	# Set the bullet to be removed after its lifetime
	await get_tree().create_timer(lifetime).timeout
	queue_free()

func _physics_process(delta: float) -> void:
	# Move the bullet based on its velocity
	global_position += velocity * delta

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("asteroids"):
		body.queue_free()
		queue_free()

func set_direction(direction: Vector2) -> void:
	velocity = direction * speed
	visible = true  # Show when fired

