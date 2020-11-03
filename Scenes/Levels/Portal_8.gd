extends Area2D


func _ready():
	pass


func _on_Portal_8_body_entered(body):
	if body.name == "Jogador":
		get_node("/root/Manager").on_level_change(8, Vector2(-256, -64))
