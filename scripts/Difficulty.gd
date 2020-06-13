extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func move(target):
	var move_tween = get_node("move_tween");
	move_tween.interpolate_property(self, "position", position, target, 2, Tween.TRANS_QUINT, Tween.EASE_OUT);
	move_tween.start();

func loadGame():
	get_tree().change_scene("res://scenes/Spaceship.tscn");

func _on_Easy_pressed() -> void:
	Global.difficulty = 0
	Global.speed = PI * 1.5
	Global.distance = -800
	loadGame()

func _on_Medium_pressed() -> void:
	Global.difficulty = 1
	Global.speed = PI * 2
	Global.distance = -1200
	loadGame()


func _on_Hard_pressed() -> void:
	Global.difficulty = 2
	Global.speed = PI * 2.5
	Global.distance = -1600
	loadGame()
