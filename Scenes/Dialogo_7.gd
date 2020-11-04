extends Area2D


var played = false

func _ready():
	add_to_group("Dialogue")


func _on_Dialogo_7_body_entered(body):
	if body.is_in_group("Coringa") and not played:
		body.set_texto("Finalmente, o mundo todo agora irá saber da beleza do sangue! O domínio da morte rubra")
		played = true
