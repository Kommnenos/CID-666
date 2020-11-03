extends Area2D


func _ready():
	pass


func _on_Portal_2_body_entered(body):
	if body.name == "Jogador":
		get_node("/root/Manager").on_level_change(2, Vector2(0, 0))
