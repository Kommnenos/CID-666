extends Node2D

var alturaMax = -1500
var alturaMin = 32
var vida = 25




func _ready():
	$TimerSangue.start()
	$TimerCanhao.start()
	add_to_group("Boss")
	
	
	
func tiro_sangue():
	
	randomize()
	var sangue = load("res://Scenes/Jogador/Sangue.tscn").instance()
	add_child(sangue)
	var sangue2 = load("res://Scenes/Jogador/Sangue.tscn").instance()
	add_child(sangue2)
	var sangue3 = load("res://Scenes/Jogador/Sangue.tscn").instance()
	add_child(sangue3)
	$TimerSangue.start()
	
func tiro_canhao():
	var canhao = load("res://Scenes/Enimigos/BOSS/Canhao.tscn").instance()
	canhao.set_as_toplevel(true)
	canhao.position = Vector2(-4864, -2176)
	add_child(canhao)
	$TimerCanhao.start()
	
func dano(dano):
	vida -= dano
		
	if vida <= 0:
		get_node("/root/Jogador").puloDuploEnable = true
		get_node("/root/Manager").boss1ded()
		queue_free()
	

func _on_TimerSangue_timeout():
	tiro_sangue()


func _on_TimerCanhao_timeout():
	tiro_canhao()
