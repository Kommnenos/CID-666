extends Node2D

var currentLevel
var miasmaAlive = true
var pacienteZero = true

onready var Jogador = get_node("/root/Jogador")

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	currentLevel = 0
	

func on_level_change(newLevel, posJog):
	get_node("/root/Jogador/Camera2D/FadeInOutRect").color = Color(0, 0, 0, 255)
	Jogador.position = posJog
	get_tree().change_scene("res://Scenes/Levels/Level_" + str(newLevel) + ".tscn")
	get_node("/root/Jogador/Camera2D").current = true
	Jogador.unpause_player()
	get_node("/root/Jogador/Camera2D/FadeInOutRect/FadeInOut").play("FadeInOut")
	
	
	
	







