extends Sprite2D

var t = 0.0

@onready var tween = get_tree().create_tween()


func _ready():
	$AnimationPlayer.play("rocking")
	tween.stop()

func _physics_process(delta):
	t += delta * 4
	
	
func fail():
	tween = create_tween()
	var target_pos = position + Vector2(0, 45)
	tween.tween_property(self, "position", target_pos, 1)
	tween.tween_callback(
		func end_movement():
			position = target_pos
	)



