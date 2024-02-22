extends CharacterBody2D

var rocks = []
var closest_rock = null
var closest_distance = 9223372036854775807

func _physics_process(delta): 
	find_closest_rock()
	var transform_scissor = %Transform.get_overlapping_bodies()
	if transform_scissor.size() > 0: 
		var new_scissor = preload("res://scissors.tscn").instantiate()
		#var static_rock = preload("res://rock.tscn").instantiate()
		new_scissor.global_position = global_position
		get_parent().add_child(new_scissor)
		get_parent().scissors.append(new_scissor)
		new_scissor.set_papers(get_parent().papers)
		queue_free()
	if rocks.size() <= 0 || closest_rock == null:
		pass
	else: 
		var direction = global_position.direction_to(closest_rock.global_position)
		velocity = direction * 100
		move_and_slide()
		

func find_closest_rock():
	var index = 0
	if rocks.is_empty():
		return
	else: 
		for i in rocks:
			if i == null:
				rocks.remove_at(index)
			else: 
				var current_node_distance = self.global_position.distance_to(i.global_position)
				if closest_distance >= current_node_distance: 
					closest_distance = current_node_distance
				closest_rock = i
			index += 1
		return closest_rock 
		
func set_rocks(rock_list):
	rocks = rock_list

func add_new_rock(rock):
	print(rocks)
	rocks.append(rock)
	print(rocks)

