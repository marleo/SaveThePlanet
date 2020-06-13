extends Sprite

var spawnPoint
export var speed = 2
var direction
var startDelay
onready var tween = get_node("Tween") 
var endPoint = Vector2(576/2, 1024/2)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("/root/Gamescreen/Score/ScoreText").text = String(Global.score)
	self.position = getRandomSpawn()
	startDelay = 1
	moveToTarget(self.position, endPoint)


func moveToTarget(start, end):
		tween.interpolate_property(self, "position", start, end, speed, Tween.TRANS_SINE, Tween.EASE_OUT, startDelay)
		match Global.difficulty:
			0:
				if(speed > 1.5):
					speed -= 0.025
			1:
				if(speed > 1.7):
					speed -= 0.025
			2:
				if(speed > 1.9):
					speed -= 0.025
			_:
				print("I shouldn't be here..")
		startDelay = 0.5
		tween.start()

func getRandomSpawn():
	randomize()
	spawnPoint = randi()%22+1
	direction = "/root/Gamescreen/SpawnPoints/spawn" + String(spawnPoint)
	return get_node(direction).position

func checkEntered(name) -> void:
	if(name == "WorldArea"):
		Global.game_end()
		endGame()
		
	elif(name == "RocketArea"):
		Global.score += 1 
		get_node("/root/Gamescreen/Score/ScoreText").text = String(Global.score)

func _on_Area2D_area_entered(area: Area2D) -> void:
	checkEntered(area.get_name())
	self.position = getRandomSpawn()
	tween.stop_all()
	if(area.get_name() == "RocketArea"):
		moveToTarget(self.position, endPoint)

func endGame():
	tween.stop_all()
	self.position = Vector2(-576, 1024)
	var player = get_node("/root/Gamescreen/Player/World")
	player.endGame()
	
