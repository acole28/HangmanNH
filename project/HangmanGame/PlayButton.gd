extends TextureButton


var game = preload("res://hangman.tscn")



func _on_pressed():
	get_tree().change_scene_to_packed(game)
