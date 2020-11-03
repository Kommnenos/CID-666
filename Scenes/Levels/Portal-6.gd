extends Area2D


func _ready():
	pass


func _on_Portal6_body_entered(body):
	if body.name == "Jogador":
		get_node("/root/Manager").on_level_change(6, Vector2(3328, -3456))
