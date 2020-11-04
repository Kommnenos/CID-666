extends Node2D

var currentLevel
var miasmaAlive = true
var pacienteZero = true
var boss1alive = true
var boss2alive = true

onready var Jogador = get_node("/root/Jogador")


func boss1ded():
	boss1alive = false
	Jogador.puloDuploEnable = true
	get_node("/root/Jogador/Coringa").set_texto("Você sente sua nova força? Você agora está mais ágil.")
	
func boss2ded():
	boss2alive = false
	get_node("/root/Jogador").BisturiBrabo = true
	get_node("/root/Jogador/Coringa").set_texto("Você sente sua nova força? Você agora está mais poderoso.")
func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	currentLevel = 0

func _process(delta):	
	if not boss2alive:
		get_tree().call_group("Boss2", "bossded")
	if not boss1alive:
		pass
	
	
func on_level_change(newLevel, posJog):
	get_node("/root/Jogador/Camera2D/FadeInOutRect").color = Color(0, 0, 0, 255)
	Jogador.position = posJog
	get_node("/root/Jogador/Coringa").position = Jogador.position - Vector2(50, 50)
	get_tree().change_scene("res://Scenes/Levels/Level_" + str(newLevel) + ".tscn")
	get_node("/root/Jogador/Camera2D").current = true
	Jogador.unpause_player()
	get_node("/root/Jogador/Camera2D/FadeInOutRect/FadeInOut").play("FadeInOut")
	
	
	
	
	







