extends Control


var letter : String

signal user_input


func letter_input(letter):
	emit_signal("user_input", letter)
#	print(letter + " From keyboard script")



func _on_a_keypress(letter):
	letter_input(letter)
	return(letter)


func _on_b_keypress():
	letter_input(letter)
	return(letter)


func _on_c_keypress():
	letter_input(letter)
	return(letter)


func _on_d_keypress():
	letter_input(letter)
	return(letter)


func _on_e_keypress(): 
	letter_input(letter)
	return(letter)


func _on_f_keypress():
	letter_input(letter)
	return(letter)


func _on_g_keypress():
	letter_input(letter)
	return(letter)


func _on_h_keypress():
	letter_input(letter)
	return(letter)


func _on_i_keypress():
	letter_input(letter)
	return(letter)


func _on_j_keypress():
	letter_input(letter)
	return(letter)
