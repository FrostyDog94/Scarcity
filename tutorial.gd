extends ColorRect

var animation_player
var current_frame


func _ready() -> void:
	animation_player = get_tree().get_root().get_node("Node/Controller/Cutscenes/Slow Buck/AnimationPlayer")
	animation_player.current_animation = "Tutorial"
	animation_player.pause()
	animation_player.seek(1)
	if Score.tutorial == true:
		self.visible = false
	
	
func _on_next_button_pressed() -> void:
	animation_player.play()
	animation_player.seek(animation_player.current_animation_position + 1)
	animation_player.pause()
	print(animation_player.current_animation_position)
	
	if animation_player.current_animation_position > 10:
		self.visible = false
		Score.tutorial = true


func _on_skip_button_pressed() -> void:
	self.visible = false
	Score.tutorial = true
