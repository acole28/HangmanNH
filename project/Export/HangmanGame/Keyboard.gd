extends Control


var letter : String

signal user_input

func letter_input(letter):
	emit_signal("user_input", letter)
	get_tree().get_root().set_disable_input(true)
	await get_tree().create_timer(2).timeout
	get_tree().get_root().set_disable_input(false)
	
	
func _on_a_keypress(letter):
	letter_input(letter)
	return(letter)


func _on_b_keypress(letter):
	letter_input(letter)
	return(letter)


func _on_c_keypress(letter):
	letter_input(letter)
	return(letter)


func _on_d_keypress(letter):
	letter_input(letter)
	return(letter)


func _on_e_keypress(letter):
	letter_input(letter)
	return(letter)


func _on_f_keypress(letter):
	letter_input(letter)
	return(letter)


func _on_g_keypress(letter):
	letter_input(letter)
	return(letter)


func _on_h_keypress(letter):
	letter_input(letter)
	return(letter)


func _on_i_keypress(letter):
	letter_input(letter)
	return(letter)
	

func _on_j_keypress(letter):
	letter_input(letter)
	return(letter)


func _on_k_keypress(letter):
	letter_input(letter)
	return(letter)


func _on_l_keypress(letter):
	letter_input(letter)
	return(letter)
	
	
func _on_m_keypress(letter):
	letter_input(letter)
	return(letter)


func _on_n_keypress(letter):
	letter_input(letter)
	return(letter)


func _on_o_keypress(letter):
	letter_input(letter)
	return(letter)


func _on_p_keypress(letter):
	letter_input(letter)
	return(letter)


func _on_q_keypress(letter):
	letter_input(letter)
	return(letter)


func _on_r_keypress(letter):
	letter_input(letter)
	return(letter)


func _on_s_keypress(letter):
	letter_input(letter)
	return(letter)


func _on_t_keypress(letter):
	letter_input(letter)
	return(letter)


func _on_u_keypress(letter):
	letter_input(letter)
	return(letter)
	
	

func _on_v_keypress(letter):
	letter_input(letter)
	return(letter)
	

func _on_w_keypress(letter):
	letter_input(letter)
	return(letter)
	

func _on_x_keypress(letter):
	letter_input(letter)
	return(letter)


func _on_y_keypress(letter):
	letter_input(letter)
	return(letter)


func _on_z_keypress(letter):
	letter_input(letter)
	return(letter)
