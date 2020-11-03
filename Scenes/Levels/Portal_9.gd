extends Area2D


func _ready():
	pass


func _on_Portal_9_body_entered(body):
	if body.name == "Jogador":
		get_node("/root/Manager").on_level_change(9, Vector2(1472, 64))
