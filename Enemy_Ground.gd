extends KinematicBody2D

export var speed = 100
export var damage = 10
var direction = 1
var velocity = Vector2.ZERO

func _physics_process(delta):
	if direction < 0 and $AnimatedSprite.flip_h:
		$AnimatedSprite.flip_h = false
	if direction > 0 and not $AnimatedSprite.flip_h:
		$AnimatedSprite.flip_h = true
	velocity.x = direction * speed
	move_and_slide_with_snap(velocity, Vector2.UP)
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.name == "Platform" or collision.collider.name == "Ground":
			direction *= -1 
		if collision.collider.name == "Player":
			collision.collider.die()
		print("Collided with ", collision.collider.name)
