extends Area2D

var played = false

func _ready():
	add_to_group("Dialogue")



	


func _on_Dialogo_3_body_entered(body):
	if body.is_in_group("Coringa") and not played:
		body.set_texto("Há algo horrível lá embaixo... Uma falsidade pútrida")
		played = true
	
