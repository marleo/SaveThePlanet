extends Node2D

onready var easy_label = get_node("VBoxContainer/Easy")
onready var medium_label = get_node("VBoxContainer/Medium")
onready var hard_label = get_node("VBoxContainer/Hard")
var score_easy
var score_medium
var score_hard

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(self.get_path())
	refreshHighscore()


func refreshHighscore():
	score_easy = Global.read_savegame("highscore0")
	score_medium = Global.read_savegame("highscore1")
	score_hard = Global.read_savegame("highscore2")
	easy_label.text = "Easy: " + String(score_easy)
	medium_label.text = "Medium: " + String(score_medium)
	hard_label.text = "Hard: " + String(score_hard)

func move(target):
	var move_tween = get_node("move_tween");
	move_tween.interpolate_property(self, "position", position, target, 2, Tween.TRANS_QUINT, Tween.EASE_OUT);
	move_tween.start();
