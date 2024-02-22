extends CharacterBody2D

var papers = []
var closest_paper = null
var closest_distance = 9223372036854775807

func _physics_process(delta):
	find_closest_paper()
	var transform_rock = %Transform.get_overlapping_bodies()
	if transform_rock.size() > 0: 
		var new_rock = preload("res://rock.tscn").instantiate()
		#var static_paper = preload("res://paper.tscn").instantiate()
		new_rock.global_position = global_position
		get_parent().add_child(new_rock)
		get_parent().rocks.append(new_rock)
		new_rock.set_scissors(get_parent().scissors) 
		#static_paper.add_new_rock(new_rock)	
		queue_free()

	if papers.size() <= 0 || closest_paper == null:
		return
	else: 
		var direction = global_position.direction_to(closest_paper.global_position)
		velocity = direction * 100
		move_and_slide()
		
func find_closest_paper():
	var index = 0
	if papers.is_empty():
		return
	else: 
		for i in papers: 
			if i == null:
				papers.remove_at(index)
			else :
				var current_node_distance = self.global_position.distance_to(i.global_position)
				if closest_distance >= current_node_distance:
					closest_distance = current_node_distance
				closest_paper = i
			index += 1
		return closest_paper 

func set_papers(paper_list):
	papers = paper_list
	
func add_new_paper(paper):
	papers.append(paper)

	
	
	
