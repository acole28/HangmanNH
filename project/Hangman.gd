extends Control

@export_file("res://Menu.tscn") var menu

var doraemon_theme = load("res://DoraemonTheme.tscn")
var pirate_theme = load("res://PirateTheme.tscn")
var keyboard = load("res://Keyboard.tscn")



var themes = [pirate_theme, doraemon_theme]

var dictionary = get_from_json("res://dictionary.json")
var valid_chars = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", 
					"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]


var selection = {} 


var event
var game_over = false

@onready var letterBox = $VBoxContainer/TopRow/HBoxContainer/LetterBox0
@onready var topRow = $VBoxContainer/TopRow/HBoxContainer
@onready var bottomRow = $VBoxContainer/BottomRow/HBoxContainer
@onready var global = get_node("/root/Global")

var answer = ""
var correct_guess = ""

var player_guess : String
var letter : String

var answer_arr = []
var correct_arr = []
var incorrect = []

var misses = 0
var t = 0.0

var delta 

func _physics_process(delta):
	t += delta * 4

func _ready():
	var topRow = $VBoxContainer/HBoxContainer
	select_word()
	print(answer)
	$LineEdit.grab_focus()
	choose_theme()
	check_for_spaces()
	
	
	
#pick a word and generate arrays to compare the correct answer and the player guess
func select_word():
	if Global.category == 0:
		randomize()
		var selection = dictionary[randi() % dictionary.size()]
		$Category.text = selection.category
		randomize()
		var answer = selection.words[randi() % selection.words.size()]
		for i in answer:
			answer_arr.append(i)
			correct_arr.append("")
		for i in answer.length() - 1:
			if correct_arr[i] != "'":
				spawnBoxes()
	elif Global.category != 0:
		randomize()
		var selection = dictionary[Global.category - 1]
		var answer = selection.words[randi() % selection.words.size()]
		$Category.text = selection.category
		for i in answer:
			answer_arr.append(i)
			correct_arr.append("")
		for i in answer.length() - 1: 
			if correct_arr[i] != "'":
				spawnBoxes()
		
	print(answer_arr)
	print(correct_arr)
	
#compare the player guess to the correct answer array. edit array 
func compare():
	var i = 0
	if answer_arr.has(str(guess())) or answer_arr.has(str(guess()).to_upper()) and not incorrect.has(guess()) and not correct_arr.has(guess()): #check index of answer_arr and put guess in correct_arr at same index
		while i < answer_arr.size(): #I figured it out somehow. This returns indexes for duplicates
			if answer_arr[i] == str(guess()):
#				print(answer_arr.find(guess(),i))
				correct_arr[i] = guess()
#				print(correct_arr)
				topRow.get_child(i).text = guess()
				is_game_over() 
				i += 1
			elif answer_arr[i] == str(guess()).to_upper():
				correct_arr[i] = guess().to_upper()
				topRow.get_child(i).text = guess().to_upper()
				is_game_over()
				i += 1
			else: 
				i += 1
	elif incorrect.has(guess()) or correct_arr.has(guess()):
		$LineEdit.clear()
	else:
		print("woops")
		incorrect.append(guess())
		if valid_chars.has(guess()):
			$VBoxContainer/Misses.text += guess() + " "
			misses += 1
			play_miss()
			is_game_over()
			get_tree().get_root().set_disable_input(true)
			await get_tree().create_timer(2).timeout
			get_tree().get_root().set_disable_input(false)

		
func _on_line_edit_text_changed(new_text):
	if $LineEdit.text != "":
		guess()
		compare()
		$LineEdit.clear()
		
		
func guess():
	if $LineEdit.text != "":
		player_guess = $LineEdit.text
		return(player_guess)
		
		
func _on_keyboard_user_input(letter): #this should get something from the virtual keyboard
	$LineEdit.text = letter
#	guess()
	compare()
#	$VBoxContainer/LineEdit.clear()
	
	


func spawnBoxes(): #one row is 16 boxes across
	var box = letterBox.duplicate()
	topRow.add_child(box, true)
	box.name = "LetterBox1"
	
	
	
	

		
func play_miss():
	get_tree().call_group("Guy", "fail")


func _on_button_pressed():
	get_tree().reload_current_scene()
	
	
func get_from_json(filename):
	var file : FileAccess = FileAccess.open("res://dictionary.json", FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	file.flush()
	return content
	
	
	
func check_for_spaces():
	var i = 0
	while i < answer_arr.size():
		print(topRow.get_child(i))
#		if answer_arr[i] == "'":
#			correct_arr[i-1] += "'"
#			correct_arr.remove_at(i)
		if answer_arr[i] == " ":
			correct_arr[i] = " "
			print("Checking for spaces!")
			topRow.get_child(i).set_visibility_layer(0)
			i += 1
		else:
			i += 1

			
			
		




func is_game_over():
	if answer_arr == correct_arr:
		$VBoxContainer/HBoxContainer3.visible = true
		$VBoxContainer/GameOver.text = "NICE JOB! Play Again?"
		$VBoxContainer/GameOver.visible = true
		$TouchKeyboard.visible = false
		game_over = true
		$KeyboardReveal.visible = false
	elif misses == 6:
		$VBoxContainer/GameOver.visible = true
		$VBoxContainer/HBoxContainer3.visible = true
		$VBoxContainer/GameOver.text = "GAME OVER! Try Again?"
		$TouchKeyboard.visible = false
		game_over = true
		$KeyboardReveal.visible = false


func choose_theme():
	randomize()
	var scene = (randi() % themes.size())
	var x = themes[scene].instantiate()
	$Theme.add_child(x)


func _on_no_pressed():
	get_tree().change_scene_to_file("res://Menu.tscn")


func _on_reset_pressed():
	get_tree().reload_current_scene()


func _on_hint_mouse_entered():
	$Category/Hint.visible = false
	

func _on_keyboard_reveal_toggled(button_pressed):
	if get_node("TouchKeyboard").visible == false:
		get_node("TouchKeyboard").visible = true
		$KeyboardReveal.position.x += 175
		$KeyboardReveal.position.y += 8
		$KeyboardReveal/Sprite2D.visible = false
		$LineEdit.grab_focus()
	else:
		get_node("TouchKeyboard").visible = false
		$KeyboardReveal.position.x -= 175
		$KeyboardReveal.position.y -= 8
		$KeyboardReveal/Sprite2D.visible = true
		$LineEdit.grab_focus()




func _on_touch_keyboard_user_input(letter):
	$LineEdit.text = letter
#	print(letter + " from the game script")
	compare()
