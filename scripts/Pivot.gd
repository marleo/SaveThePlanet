extends Node2D


var rotation_speed = Global.speed 
var revertMovement = true
var deltaTime
var changed = false

func _process(delta):
	deltaTime = delta
	if(revertMovement):
		$Rocket.position.y = Global.distance
		self.rotation += rotation_speed * delta
	else:
		$Rocket.position.y = Global.distance
		self.rotation += rotation_speed * delta * -1


func _on_Button_pressed() -> void:
	changed = false
	if(revertMovement):
		revertMovement = false
		$Rocket.flip_v = true
		changed = true
	if(!changed):
		revertMovement = true;
		$Rocket.flip_v = false;
