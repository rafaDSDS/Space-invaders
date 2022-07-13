extends Node2D

const ENEMY = preload("res://scene/Enemy.tscn")

var de = 0.5
var para = 3.5


func _physics_process(delta):
	if Input.is_action_just_pressed("dif_plus"):
		de -= 1
		para -= 1
		if de == 1:de = 1
		if para == 1:para = 1
	if Input.is_action_just_pressed("dif_less"):
		de += 1
		para += 1
	$Label.text = 'Score: '+ str(Global.score)

func _on_Spawn_timer_timeout():
	randomize() 
	$"Spawn timer".wait_time = rand_range(de,para)
	var enemy_inst = ENEMY.instance()
	enemy_inst.position.y = $Enemy_spawn.position.y
	add_child(enemy_inst)
	


func _on_end_body_entered(body):
	if 'Enemy' in body.name:
		Global.score = 0
		get_tree().reload_current_scene()
