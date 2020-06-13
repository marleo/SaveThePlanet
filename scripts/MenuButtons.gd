extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_Start_pressed() -> void:
	get_node("Start").move(Vector2(-576, 0));
	get_node("Difficulty").move(Vector2(0, 0));


func _on_Back_pressed() -> void:
	get_node("Start").move(Vector2(0, 0));
	get_node("Difficulty").move(Vector2(576, 0));



func _on_Highscores_pressed() -> void:
	get_node("Start").move(Vector2(576, 0));
	get_node("Highscore").move(Vector2(0, 0));


func _on_Back2_pressed() -> void:
	get_node("Start").move(Vector2(0, 0));
	get_node("Highscore").move(Vector2(-576, 0));


func _on_Quit_pressed() -> void:
	get_tree().quit()
