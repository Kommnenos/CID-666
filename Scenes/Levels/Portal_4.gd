extends Area2D


func _ready():
	pass



func _on_Portal_4_body_entered(body):
	if body.name == "Jogador":
		get_node("/root/Manager").on_level_change(4, Vector2(0, 384))
