extends Area2D

func _process(delta):
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)



func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size()>0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)


func shoot():
	const BULLET= preload("res://scenes/bullet.tscn")
	var new_bullet =BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)
	
	var shooting_point = %ShootingPoint  # Adjust this path to match your actual scene structure
	new_bullet.global_position = shooting_point.global_position
	new_bullet.global_rotation = shooting_point.global_rotation
	get_parent().add_child(new_bullet)  # Add bullet to the scene


func _on_timer_timeout() -> void:
	shoot()
