extends Area2D



func _ready():
	add_to_group("Dialogue")


func _on_Dialogo_1_body_entered(body):
	if body.is_in_group("Coringa"):
		body.set_texto("pioauhfdsgoiaudshfgpiduhfagpaudhgfpoiafsdjhgpoidufhjgpoiudahfgiopudshfgi")
		print("Carai")
	
