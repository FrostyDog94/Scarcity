extends AnimationPlayer

var travel_cost 
var cutscene_manager 
var slow_buck
var med_buck
var long_buck
var animation
var short_label
var med_label
var long_label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cutscene_manager = get_tree().get_root().get_node("Node/Controller/Cutscenes")
	slow_buck = get_tree().get_root().get_node("Node/Controller/Cutscenes/Slow Buck")
	med_buck = get_tree().get_root().get_node("Node/Controller/Cutscenes/Buck Med")
	long_buck = get_tree().get_root().get_node("Node/Controller/Cutscenes/Buck Long")
	short_label = get_tree().get_root().get_node("Node/Controller/Cutscenes/Short Label")
	med_label = get_tree().get_root().get_node("Node/Controller/Cutscenes/Med Label")
	long_label = get_tree().get_root().get_node("Node/Controller/Cutscenes/Long Label")
	
	_disable_cutscene()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _travel_cutscene():
	travel_cost = get_tree().get_root().get_node("Node/Controller").travel_cost
	cutscene_manager.visible = true
	if travel_cost <= 5:
		animation = "Short Travel"
		cutscene_manager.texture = load("res://Travel Textures/Short Travel.jpg")
		slow_buck.visible = true
		short_label.visible = true
		self.play("Short Travel")
	elif travel_cost > 5 && travel_cost <=10:
		animation = "Med Travel"
		cutscene_manager.texture = load("res://Travel Textures/Med Travel.jpg")
		med_buck.visible = true
		med_label.visible = true
		self.play("Med Travel")
	elif travel_cost > 10:
		animation = "Long Travel"
		cutscene_manager.texture = load("res://Travel Textures/Long Travel.jpg")
		long_buck.visible = true
		long_label.visible = true
		self.play("Long Travel")
	
	
func _disable_cutscene():
	cutscene_manager.visible = false
	slow_buck.visible = false
	med_buck.visible = false
	long_buck.visible = false
	short_label.visible = false
	med_label.visible = false
	long_label.visible = false


func _on_animation_finished(animation) -> void:
	_disable_cutscene()
	

	
