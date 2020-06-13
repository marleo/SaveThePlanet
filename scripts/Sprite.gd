extends Sprite


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	self.rotate(-.0025)

func endGame():
	var tween = get_node("../Tween")
	tween.interpolate_property(self, "position", position, Vector2(-576, 1024/2), 2, Tween.TRANS_QUINT, Tween.EASE_OUT, 0.2)
	tween.start()
	var gameOver = get_node("../../GameOver/")
	gameOver.move()
