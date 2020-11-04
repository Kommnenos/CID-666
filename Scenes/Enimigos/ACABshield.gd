extends KinematicBody2D

onready var Jogador = get_node("/root/Jogador")
var canFire = true
var inRange = false
var counter = 0
var movimento = Vector2(0, 0)
const CIMA = Vector2(0, -1)
var velocidade = 50
var alcance = 380
var atirando = false
var dirJogador = 0
var moveKey = -1

var vidas = 3

func _ready():
	add_to_group("Minions")
	
func dano(dano):
	if get_node("/root/Manager").boss2alive == false:
		vidas -= dano
		if vidas <= 0:
			
			queue_free()



func _process(delta):
#	update()
	ready()
	aim()
	if canFire and inRange:
		fire()
	
	move_and_slide(movimento, CIMA)
	
#func _draw():
#	draw_circle($Sprite.position, alcance, Color(0, 0, 255, 0.01))	
#
func gooseStep():
	if moveKey == -1 and not atirando:
		movimento.x = -velocidade
		moveKey = 0
		$TimerAndar.start()
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("AndandoPol")
	elif moveKey == 0 and not atirando:
		movimento.x = velocidade
		moveKey = 1
		$TimerAndar.start()
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("AndandoPol")
	elif moveKey == 1 and not atirando:
		movimento.x = -velocidade
		moveKey = 0
		$TimerAndar.start()
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("AndandoPol")
	
	
	
	
	
	
	
	



func ready():
	velocidade = 0.001
	if Jogador.position.distance_to(position) < alcance:
		inRange = true
	else:
		inRange = false
	

func aim():
	##Jogador à direita
	if Jogador.position.x > position.x:
		dirJogador = 1
	elif Jogador.position.x < position.x:
		dirJogador = -1

func fire():
	
	
	var bala1 = load("res://Scenes/Enimigos/Bala.tscn").instance()
	var bala2 = load("res://Scenes/Enimigos/Bala.tscn").instance()
	var bala3 = load("res://Scenes/Enimigos/Bala.tscn").instance()
	
	##Atirar à direita
	if dirJogador == 1:
		atirando = true
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("TiroPol")
		movimento.x = 0
		bala1.projVelX = 300
		bala1.projVelY = -300
		bala2.projVelX = 300
		bala2.projVelY = 0
		bala3.projVelX = 300
		bala3.projVelY = 300
	
	##Atirar à esquerda
	if dirJogador == -1:
		atirando = true
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("TiroPol")
		movimento.x = 0
		bala1.projVelX = -300
		bala1.projVelY = -300
		bala2.projVelX = -300
		bala2.projVelY = 0
		bala3.projVelX = -300
		bala3.projVelY = 300
	
	add_child(bala1)
	add_child(bala2)
	add_child(bala3)
	counter += 1
	canFire = false	
	if counter < 3:
		$TimerBurst.start()
	
	$TimerTiro.start()
	
	
	
	
	
	
	
	

func _on_TimerBurst_timeout():
	canFire = true


func _on_TimerTiro_timeout():
	counter = 0
	canFire = true
	atirando = false
	gooseStep()
	
	
	
	
	
	
	
	
	





func _on_TimerAndar_timeout():
	gooseStep()



























