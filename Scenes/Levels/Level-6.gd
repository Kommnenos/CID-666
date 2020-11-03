extends Area2D


func _ready():
	pass


func _on_Level6_body_entered(body):
	if body.name == "Jogador":
		get_node("/root/Manager").on_level_change(10, Vector2(-832, 0))
