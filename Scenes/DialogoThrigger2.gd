extends Area2D

var played = false

func _ready():
	add_to_group("Dialogue")


func _on_Dialogo_1_body_entered(body):
	if body.is_in_group("Coringa") and not played:
		body.set_texto("Mostre a eles a beleza escarlate!")
		played = true
	
