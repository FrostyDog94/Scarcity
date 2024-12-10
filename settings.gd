extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("Min Roll/Min Roll Text").text = str(Score.roll_min)
	get_node("Max Roll/Max Roll Text").text = str(Score.roll_max)
	get_node("Hab Decrease/Hab Decrease Text").text = str(Score.hab_decrease)
	get_node("Daily Cost/Daily Cost Text").text = str(Score.daily_cost)
	get_node("Days/Days Text").text = str(Score.days)
	get_node("LTC/LTC Text").text = str(Score.LTC)
	get_node("MTC/MTC Text").text = str(Score.MTC)
	get_node("STC/STC Text").text = str(Score.STC)
	get_node("Start Energy/Start Energy Text").text = str(Score.start_energy)
	get_node("Low Hab/Low Hab Text").text = str(Score.low_hab)
	get_node("Med Hab/Med Hab Text").text = str(Score.med_hab)
	get_node("High Hab/High Hab Text").text = str(Score.high_hab)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Main Menu.tscn")
	Score.roll_min = int(get_node("Min Roll/Min Roll Text").text)
	Score.roll_max = int(get_node("Max Roll/Max Roll Text").text)
	Score.hab_decrease = int(get_node("Hab Decrease/Hab Decrease Text").text)
	Score.daily_cost = int(get_node("Daily Cost/Daily Cost Text").text)
	Score.days = int(get_node("Days/Days Text").text)
	Score.LTC = int(get_node("LTC/LTC Text").text)
	Score.MTC = int(get_node("MTC/MTC Text").text)
	Score.STC = int(get_node("STC/STC Text").text)
	Score.start_energy = int(get_node("Start Energy/Start Energy Text").text)
	Score.low_hab = int(get_node("Low Hab/Low Hab Text").text)
	Score.med_hab = int(get_node("Med Hab/Med Hab Text").text)
	Score.high_hab = int(get_node("High Hab/High Hab Text").text)
