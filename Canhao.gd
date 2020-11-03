extends KinematicBody2D

const GRAVIDADE = 50
const CIMA = Vector2(0, 1)
var movimento = Vector2(0, 0)

func _ready():
	movimento.x += 700
	movimento.y += -1500

func _physics_process(delta):
	gravidade()
	move_and_slide(movimento, CIMA)
	
	





func gravidade():
	movimento.y += GRAVIDADE
