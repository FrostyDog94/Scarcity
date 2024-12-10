extends Node

var roll1 
var roll2 = 0
var habitat_energy 
var energy_gained : float
var travel_cost = 0
var hab = 0
var trav = 0
var net_energy = 0
var total_energy = 20
var fitness 
var total_rolls = 30
var offspring 
var background
var buck
var animation_player

var roll_min 
var roll_max 
var hab_decrease 
var daily_cost 
var LTC
var MTC
var STC


func _ready() -> void:
	fitness = 0
	offspring = 0
	background = get_node("TextureRect")
	buck = get_node("Elk")
	animation_player = get_tree().get_root().get_node("Node/Controller/Cutscenes/Slow Buck/AnimationPlayer")
	AudioPlayer._play_audio_level()
	AudioPlayer.stream_paused = false
	
	roll_min = Score.roll_min
	roll_max = Score.roll_max
	hab_decrease = Score.hab_decrease
	daily_cost = Score.daily_cost
	LTC = Score.LTC
	MTC = Score.MTC
	STC = Score.STC
	total_rolls = Score.days
	total_energy = Score.start_energy
	habitat_energy = Score.med_hab
	
	get_node("Cutscenes/Short Label/Short Number").text = str(STC)
	get_node("Cutscenes/Med Label/Med Number").text = str(MTC)
	get_node("Cutscenes/Long Label/Long Number").text = str(LTC)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if habitat_energy <= 0:
		habitat_energy = 0
		
	if total_energy <= 0:
		total_energy = 0
		get_tree().change_scene_to_file("res://Game Over.tscn")
		
	if total_rolls <= 0:
		get_tree().change_scene_to_file("res://Win.tscn")
		Score.fitness = fitness
		Score.offspring = offspring
		
	fitness = snapped(((total_energy - 20) / 15), 0.01)
	offspring = int(fitness)
		
	get_node("Roll_Value_Text/Roll_Value").text = str(roll2)
	get_node("Habitat_Energy_Text/Habitat_Energy").text = str(habitat_energy)
	get_node("Energy_Gained_Text/Energy_Gained").text = str(energy_gained)
	get_node("Travel_Cost_Text/Travel_Cost").text = str(travel_cost)
	get_node("Net_Energy_Gained_Text/Net_Energy_Gained").text = str(net_energy)
	get_node("Total_Energy_Text/Total_Energy").text = str(snapped(total_energy, 0.01))
	get_node("Fitness_Text/Fitness").text = str(fitness)
	get_node("Rolls_Left_Text/Rolls_Left").text = str(total_rolls)
	
	_update_background()
	_update_elk()
	
	
func _roll1():
	roll1 = randi_range(1, 3)
	return roll1


func _roll2():
	roll2 = randi_range(roll_min, roll_max)
	return roll2
	
	
func _get_habitat_energy():
	hab = _roll1()
	if hab == 1: 
		habitat_energy = Score.low_hab
	elif hab == 2:
		habitat_energy = Score.med_hab
	elif hab == 3:
		habitat_energy = Score.high_hab
	
	return habitat_energy
	
	
func _get_travel_cost():
	trav = _roll1()
	if trav == 1:
		travel_cost = STC
	elif trav == 2:
		travel_cost = MTC
	elif trav == 3:
		travel_cost = LTC
		
	return travel_cost
		
	
func _on_forage_button_pressed() -> void:
	get_node("Bite").play()
	_roll2()
	energy_gained = roll2 * (habitat_energy * 0.01)
	net_energy = energy_gained - daily_cost
	
	if habitat_energy > 0:
		habitat_energy -= hab_decrease
	elif habitat_energy <= 0:
		habitat_energy = 0
	
	total_energy += net_energy
	
	if travel_cost > 0:
		travel_cost = 0
		
	total_rolls -= 1

	
func _on_travel_button_pressed() -> void:
	_get_travel_cost()
	_get_habitat_energy()
	animation_player._travel_cutscene()
	roll2 = 0
	energy_gained = 0
	net_energy = 0
	total_energy -= travel_cost
	total_rolls -= 1


func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Main Menu.tscn")
	
	
func _update_background():
	if habitat_energy > 100:
		background.texture = load("res://background textures/Habitat 150.jpg")
	elif habitat_energy > 50 && habitat_energy <= 100:
		background.texture = load("res://background textures/Habitat 100.jpg")
	elif habitat_energy > 25 && habitat_energy <= 50:
		background.texture = load("res://background textures/Habitat 50.jpg")
	elif habitat_energy > 0 && habitat_energy <= 25:
		background.texture = load("res://background textures/Habitat 25.jpg")
	elif habitat_energy <= 0:
		background.texture = load("res://background textures/Habitat 0.jpg")
		
		
func _update_elk():
	if total_energy >= 30:
		buck.texture = load("res://Sprites/30 buck.png")
	elif total_energy > 10 && total_energy < 30:
		buck.texture = load("res://Sprites/20 buck.png")
	elif total_energy <= 10:
		buck.texture = load("res://Sprites/10 buck.png")
		
		
