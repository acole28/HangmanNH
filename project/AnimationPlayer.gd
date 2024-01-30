extends AnimationPlayer



func _ready():
	play("rocking")
	

func sink():
	var tween = create_tween()
	var target_pos = get_parent().position + Vector2(0, 45)
	tween.tween_property(get_parent(), "position", target_pos, 1)
	tween.tween_callback(
		func end_movement():
			get_parent().position = target_pos
)
