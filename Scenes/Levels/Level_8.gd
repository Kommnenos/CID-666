extends Node2D


func _ready():
	Jogador.pause_player()


func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/UI/MenuPrincipal.tscn")
