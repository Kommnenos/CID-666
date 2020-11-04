extends KinematicBody2D

const GRAVIDADE = 50
const CIMA = Vector2(0, 1)
var movimento = Vector2(0, 0)

func _ready():
	randomize()
	movimento.x += rand_range(1000, 3000)
	movimento.y += rand_range(500, 800)

func _physics_process(delta):
	gravidade()
	move_and_slide(movimento, CIMA)
	
	





func gravidade():
	movimento.y += GRAVIDADE
