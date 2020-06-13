extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func move():
	var tween = get_node("Tween")
	tween.interpolate_property(self, "position", position, Vector2(0, 0), 2, Tween.TRANS_QUINT, Tween.EASE_OUT, 0.2)
	tween.start()


func _on_StartAgain_pressed() -> void:
	Global.score = 0
	get_tree().change_scene("res://scenes/Spaceship.tscn")
