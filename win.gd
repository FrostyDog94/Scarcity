extends Node

var fitness
var offspring
var subtitle 
var background

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	subtitle = get_node("Subtitle")
	fitness = Score.fitness
	offspring = Score.offspring
	background = get_node("TextureRect")
	
	get_node("Fitness text/Fitness").text = str(snapped(Score.fitness, 0.01))
	get_node("Offspring Text/Offspring").text = str(Score.offspring)
	
	if fitness >= 1:
		subtitle.text = "And you produced offspring!"
	elif fitness < 1:
		subtitle.text = "But you didn't produce any offspring"
		
	if offspring == 0:
		background.texture = load("res://Win-lose backgrounds/NoOffspring.jpg")
	elif offspring == 1:
		background.texture = load("res://Win-lose backgrounds/OneOffspring.jpg")
	elif offspring == 2:
		background.texture = load("res://Win-lose backgrounds/TwoOffspring.jpg")
	elif offspring == 3:
		background.texture = load("res://Win-lose backgrounds/ThreeOffspring.jpg")
	elif offspring == 4:
		background.texture = load("res://Win-lose backgrounds/FourOffspring.jpg")
		

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Game.tscn")


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Main Menu.tscn")
