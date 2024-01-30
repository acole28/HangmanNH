extends Node

var i = 0

func fail():
	$NobitaBG.get_child(i).visible = true
	i += 1
	if i == 6:
		$Crying.visible = true
		
	
