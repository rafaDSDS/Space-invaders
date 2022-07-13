extends KinematicBody2D

var speed = 150
const bullet = preload("res://scene/Bullet.tscn")
var on_shot = false

func _physics_process(delta):
	var vect = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):vect.x -= 1
	elif Input.is_action_pressed("ui_right"):vect.x += 1
	if Input.is_action_just_pressed("attack"):
		if on_shot == false:
			get_parent().add_child(bullet.instance())
			on_shot = true
	vect = move_and_slide(vect * speed)


func _on_timer_timeout():
	if on_shot == true:
		on_shot = false
		$timer.autostart = false
