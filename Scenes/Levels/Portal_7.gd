extends Area2D


func _ready():
	pass


func _on_Portal_7_body_entered(body):
	if body.name == "Jogador":
		get_node("/root/Manager").on_level_change(7, Vector2(0, -2048))
