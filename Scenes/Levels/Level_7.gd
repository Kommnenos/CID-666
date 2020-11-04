extends Node2D

var bossded = false

func _ready():
	add_to_group("Boss2")

func bossded():
	bossded = true
func _process(delta):
	if bossded:
		if $CoringaVirusBoss1 != null:
			$CoringaVirusBoss1.queue_free()
