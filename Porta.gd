extends Node2D

var shootable = true

func become_shoot():
	shootable = true
	
func _ready():
	add_to_group("Portas")
	
	












func _on_Area2D_area_entered(area):
	if shootable:
		$StaticBody2D.queue_free()
		$AnimatedSprite.play()
