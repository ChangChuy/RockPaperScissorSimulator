extends Node2D


var rocks: Array[Node] = []
var papers: Array[Node] = []
var scissors: Array[Node] = []

var number_of_sets

func _ready():
	pass
	
func _process(delta):
	pass

func spawn_all():
	var new_scissor = preload("res://scissors.tscn").instantiate()
	scissors.append(new_scissor)
	%ScissorsPath.progress_ratio = randf()
	new_scissor.global_position = %ScissorsPath.global_position
	add_child(new_scissor)
	var new_paper = preload("res://paper.tscn").instantiate()
	papers.append(new_paper)
	%PaperPath.progress_ratio = randf()
	new_paper.global_position = %PaperPath.global_position
	add_child(new_paper)
	var new_rock = preload("res://rock.tscn").instantiate()
	rocks.append(new_rock)
	%RockPath.progress_ratio = randf()
	new_rock.global_position = %RockPath.global_position
	add_child(new_rock)
	new_scissor.set_papers(papers)
	new_rock.set_scissors(scissors)
	new_paper.set_rocks(rocks)

func settting_number_of_rock_paper_scissor_sets(num):
	number_of_sets = num

func _on_timer_timeout():
	
	for i in range(0,number_of_sets):
		spawn_all()
