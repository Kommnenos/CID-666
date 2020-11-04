extends Control




func _ready():
	pass


func _on_Jogar_pressed():
	get_node("/root/Manager").on_level_change(1, Vector2(-400, 0))


func _on_Creditar_pressed():
	get_tree().change_scene("res://Scenes/Jogador/Creditos.tscn")


func _on_Vazar_pressed():
	get_tree().quit()
