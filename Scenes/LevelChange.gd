extends Area2D


func _ready():
	pass


func _on_LevelChange_body_entered(body):
	if body.name == "Jogador":
		get_node("/root/Manager").on_level_change(str(int(self.name)))
