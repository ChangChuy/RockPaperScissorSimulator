extends Control

var sets_number = 0

func _on_input_button_pressed():
	var input_value = int($TextEdit.text)
	
	if input_value > 0:
		var next_scene = preload("res://game.tscn").instantiate()
		#next_scene.number_of_sets = input_value
		next_scene.settting_number_of_rock_paper_scissor_sets(input_value)
		get_tree().root.add_child(next_scene)
		queue_free()
		#hide()
	else: 
		$TextEdit.text = ""
		$TextEdit.placeholder_text = "Not an integer try again please"
	
		
