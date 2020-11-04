extends Area2D

var used = false
var playerInArea = false
var Player = null

func _ready():
	pass


func _process(delta):
	if not used and Input.is_action_just_pressed("Interact"):
		if Player != null:
			print("lelek")
			Player.sangue()
			used = true
			$Sprite.texture = load("res://assets/Paciente-Sugando-cama_03.png")
			$AudioStreamPlayer.play()
func _on_Paciente_body_entered(body):
	Player = body
	playerInArea = true
	


func _on_Paciente_body_exited(body):
	Player = null
	playerInArea = false


