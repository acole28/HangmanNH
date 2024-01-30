extends Control


@export_file("res://hangman.tscn") var game

var dictionary = get_from_json("res://dictionary.json")



func _ready():
	pass
	make_list()


func make_list():
	$VBoxContainer/VBoxContainer/CategoryOptions.add_item("なし")
	for i in dictionary.size():
		var category = dictionary[i].category
		$VBoxContainer/VBoxContainer/CategoryOptions.add_item(category)
		
		
		
	
	
	
	
func get_from_json(filename):
	var file : FileAccess = FileAccess.open("res://dictionary.json", FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	file.flush()
	return content


func _on_category_options_item_selected(index):
	var global = get_node("/root/Global")
	Global.category = ($VBoxContainer/VBoxContainer/CategoryOptions.selected)
	print(Global.category)
