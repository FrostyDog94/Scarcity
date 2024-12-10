extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("Min Roll/Min Roll Text").text = str(Score.roll_min)
	get_node("Max Roll/Max Roll Text").text = str(Score.roll_max)
	get_node("Hab Decrease/Hab Decrease Text").text = str(Score.hab_decrease)
	get_node("Daily Cost/Daily Cost Text").text = str(Score.daily_cost)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Main Menu.tscn")
	Score.roll_min = int(get_node("Min Roll/Min Roll Text").text)
	Score.roll_max = int(get_node("Max Roll/Max Roll Text").text)
	Score.hab_decrease = int(get_node("Hab Decrease/Hab Decrease Text").text)
	Score.daily_cost = int(get_node("Daily Cost/Daily Cost Text").text)
