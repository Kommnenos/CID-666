extends Node2D




	
func _ready():
	pass
	
	











func _on_Area2D_area_entered(area):
	
	
	if area.is_in_group("BisturiBrabo"):
		$StaticBody2D.queue_free()
		$AnimatedSprite.play()
		$Area2D.queue_free()
