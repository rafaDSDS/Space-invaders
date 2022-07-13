extends KinematicBody2D

var speed = 600

func _ready():
	position = get_parent().get_node('Player').position

func _physics_process(delta):
	var vect = Vector2.ZERO
	vect.y -= 1
	vect = move_and_slide(vect * speed)
 

func _on_Area2D_body_entered(body):
	if body.name != 'Player':
		Global.score += 1
		body.queue_free()


func _on_Timer_timeout():
	queue_free()
