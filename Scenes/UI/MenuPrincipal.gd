extends Control




func _ready():
	pass


func _on_Jogar_pressed():
	get_node("/root/Manager").on_level_change(1, Vector2(0, 0))


func _on_Creditar_pressed():
	pass # Replace with function body.


func _on_Vazar_pressed():
	pass # Replace with function body.
