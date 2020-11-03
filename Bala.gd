extends Area2D

var projVelX
var projVelY
var dano = 1

func _ready():
	set_as_toplevel(true)
	global_position = get_parent().global_position


func _process(delta):
	position.x += projVelX * delta
	position.y += projVelY * delta
	colisao()
	
	
func colisao():
	var colisor = get_overlapping_bodies()
	for coisa in colisor:
		
		if coisa.name == "Jogador":
			coisa.dano(dano)
			queue_free()	
		else:
			queue_free()
			
		

func _on_Timer_timeout():
	queue_free()
