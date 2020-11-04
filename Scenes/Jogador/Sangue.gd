extends Area2D

var projVel = 750
var dano = 2


func _ready():
	randomize()
	set_as_toplevel(true)
	global_position = get_parent().global_position
	position.x = -4992
	position.y = rand_range(-1408, 128)

func _process(delta):
	position.x += projVel * delta
	colisao()


func colisao():
	var colisor = get_overlapping_bodies()
	for coisa in colisor:
		
		if coisa.name == "Jogador":
			coisa.dano(dano)
			queue_free()	
		else:
			queue_free()
			
