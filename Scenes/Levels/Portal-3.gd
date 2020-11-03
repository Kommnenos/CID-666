extends Area2D


func _ready():
	pass


func _on_Portal3_body_entered(body):
	if body.name == "Jogador":
		get_node("/root/Manager").on_level_change(3, Vector2(1920, 384))
