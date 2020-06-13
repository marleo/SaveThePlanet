extends Node2D

var difficulty
var speed
var distance
var score = 0
var saved = false

var savegame = File.new()
var save_path = "user://savegame.data" 
var save_data = {"highscore0": 0, "highscore1": 0, "highscore2": 0} 

func _ready() -> void:
	if not savegame.file_exists(save_path):
		create_save()

func game_end():
	print("Game Ended")
	var highscore = read_savegame("highscore" + String(difficulty))
	print("Highscore: " + String(highscore))
	if(highscore < score):
		save(score)
		score = 0

func create_save():
	savegame.open(save_path, File.WRITE)
	savegame.store_line(to_json(save_data))
	savegame.close()

func save(high_score):
	var savename = "highscore" + String(difficulty)
	save_data[savename] = high_score #data to save
	savegame.open(save_path, File.WRITE) #open file to write
	savegame.store_line(to_json(save_data)) #store the data
	savegame.close() # close the file

func read_savegame(savename):
	savegame.open(save_path, File.READ) #open the file
	save_data = parse_json(savegame.get_line()) #get the value
	savegame.close() #close the file
	return save_data[savename] #return the value
