extends KinematicBody2D

func _ready():
	randomize()
	$AnimatedSprite.frame = rand_range(0,9)

onready var jump = 35
onready var speed = -100

func _physics_process(delta):
	var vect = Vector2.ZERO
	if $RayCast2D.is_colliding():
		position.y += jump
		speed *= -1
		$RayCast2D.scale.x *= -1
	vect.x += speed
	vect = move_and_slide(vect)
	
