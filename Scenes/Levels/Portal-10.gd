extends Area2D


func _ready():
	pass


func _on_Portal10_body_entered(body):
	if body.name == "Jogador":
		get_node("/root/Manager").on_level_change(10, Vector2(1152, 0))
