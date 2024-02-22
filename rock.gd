extends CharacterBody2D

var scissors = []
var closest_scissors = null
var closest_distance = 9223372036854775807

func _physics_process(delta):
	find_closest_scissors()
	var transform_paper = %Transform.get_overlapping_bodies()
	if transform_paper.size() > 0: 
		var new_paper = preload("res://paper.tscn").instantiate()
		#var static_scissor = preload("res://scissors.tscn").instantiate()
		new_paper.global_position = global_position
		get_parent().add_child(new_paper)
		get_parent().papers.append(new_paper)
		new_paper.set_rocks(get_parent().rocks)
		#static_scissor.add_new_paper(new_paper)
		queue_free()
		
	if scissors.size() <= 0 || closest_scissors == null:
		return
	else: 
		var direction = global_position.direction_to(closest_scissors.global_position)
		velocity = direction * 100
		move_and_slide()
		
func find_closest_scissors():
	var index = 0
	if scissors.is_empty():
		return
	else: 
		for i in scissors:
			if i == null:
				scissors.remove_at(index)
			else: 
				var current_node_distance = self.global_position.distance_to(i.global_position)
				if closest_distance >= current_node_distance: 
					closest_distance = current_node_distance
				closest_scissors = i
			index += 1
		return closest_scissors
	
func set_scissors(scissors_list):
	scissors = scissors_list
	
func add_new_scissor(new_scissor):
	scissors.append(new_scissor)
	
