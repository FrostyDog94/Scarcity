extends Node


var credits
var fullscreen = true

func _ready() -> void:
	AudioPlayer.stream_paused = true
	credits = get_node("Credits")

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Game.tscn")
	

func _on_quit_button_pressed() -> void:
	get_tree().quit()
	

func _on_rules_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Rules.tscn")
	

func _toggle_credits():
	if credits.visible == false:
		credits.visible = true
	elif credits.visible == true:
		credits.visible = false


func _on_credits_button_pressed() -> void:
	_toggle_credits()


func _on_button_pressed() -> void:
	_toggle_credits()


func _on_check_button_toggled(fullscreen) -> void:
	if fullscreen == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	elif fullscreen == false:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_settings_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Settings.tscn")
