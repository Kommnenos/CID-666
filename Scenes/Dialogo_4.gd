extends Area2D

var played = false

func _ready():
	add_to_group("Dialogue")



	



func _on_Dialogo_4_body_entered(body):
	if body.is_in_group("Coringa") and not played:
		body.set_texto("Sim, cada vez mais perto da verdadeira marca... Aquela maldita será a fonte perfeita de sangue!")
		played = true
