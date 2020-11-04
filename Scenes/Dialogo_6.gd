extends Area2D


var played = false

func _ready():
	add_to_group("Dialogue")



	
	

func _on_Dialogo_6_body_entered(body):
	if body.is_in_group("Coringa") and not played:
		body.set_texto("É chegada a hora. Já lhe foram revelados os segredos das marcas. O sangue nesse local é poderoso")
		played = true
