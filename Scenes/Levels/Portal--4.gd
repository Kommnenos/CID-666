extends Area2D


func _ready():
	pass


func _on_Portal4_body_entered(body):
	if body.name == "Jogador":
		get_node("/root/Manager").on_level_change(4, Vector2(-3520, -1408))
