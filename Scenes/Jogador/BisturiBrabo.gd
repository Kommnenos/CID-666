extends Area2D

var projVel
var dano = 1
func _ready():
	set_as_toplevel(true)
	global_position = get_parent().global_position
	add_to_group("BisturiBrabo")

func _process(delta):
	position.x += projVel * delta
	colisao()
	
	
func colisao():
	var colisor = get_overlapping_bodies()
	for coisa in colisor:
		
		if coisa is StaticBody2D:
			queue_free()
		if coisa.is_in_group("Minions") or coisa.is_in_group("Boss"):
			coisa.dano(dano)
			queue_free()	
			
		
		

func _on_Timer_timeout():
	queue_free()
