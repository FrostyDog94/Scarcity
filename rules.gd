extends Node
var rule_page = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("Rules1").visible = true
	get_node("Rules2").visible = false
	get_node("Rules3").visible = false
	get_node("Rules4").visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_next_button_pressed() -> void:
	rule_page += 1
	if rule_page == 1:
		get_node("Rules1").visible = true
		get_node("Rules2").visible = false
		get_node("Rules3").visible = false
		get_node("Rules4").visible = false
	elif rule_page == 2:
		get_node("Rules1").visible = false
		get_node("Rules2").visible = true
		get_node("Rules3").visible = false
		get_node("Rules4").visible = false
	elif rule_page == 3:
		get_node("Rules1").visible = false
		get_node("Rules2").visible = false
		get_node("Rules3").visible = true
		get_node("Rules4").visible = false
	elif rule_page == 4:
		get_node("Rules1").visible = false
		get_node("Rules2").visible = false
		get_node("Rules3").visible = false
		get_node("Rules4").visible = true
	elif rule_page == 5:
		get_tree().change_scene_to_file("res://Main Menu.tscn")
