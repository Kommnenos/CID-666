extends Area2D


func _ready():
	pass


func _on_Portal_5_body_entered(body):
	if body.name == "Jogador":
		get_node("/root/Manager").on_level_change(5, Vector2(-128, -320))
