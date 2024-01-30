extends Button

@export var letter : String

signal keypress


#func _on_mouse_entered():
#	emit_signal('keypress', letter)
#	return(letter)
	




#func _on_input_event(viewport, event, shape_idx):
#	if (event.type == input_even && event.pressed):
#		emit_signal('keypress', letter)
#		return(letter)








func _on_pressed():
	emit_signal('keypress', letter)
	return(letter)
