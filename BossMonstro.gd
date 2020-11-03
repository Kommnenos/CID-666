extends Node2D

var alturaMax = -512
var alturaMin = 32




func _ready():
	$TimerSangue.start()
	$TimerCanhao.start()
	
	
	
func tiro_sangue():
	randomize()
	var tiro = load("res://Scenes/Enimigos/Bala.tscn").instance()
	tiro.set_as_toplevel(true)
	
	tiro.projVelX = 500
	tiro.projVelY = 0
	add_child(tiro)
	tiro.position.y = rand_range(alturaMax, alturaMin)
	$TimerSangue.start()
	
func tiro_canhao():
	var canhao = load("res://Scenes/Enimigos/BOSS/Canhao.tscn").instance()
	canhao.set_as_toplevel(true)
	add_child(canhao)
	$TimerCanhao.start()
	
	


func _on_TimerSangue_timeout():
	tiro_sangue()


func _on_TimerCanhao_timeout():
	tiro_canhao()
