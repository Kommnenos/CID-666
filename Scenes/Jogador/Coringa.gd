extends KinematicBody2D

#General Kinematic variables
var movimento = Vector2(0, 0)
var velocidade = 100
var velocidadeMax = 1500
const GRAVIDADE = 150
const CIMA = Vector2(0, -1)
var puloVelocidade = 3500
const LIMMUNDO = 7000
var atrito = 0.15
onready var Jogador = get_parent()

##Bot control/follow variables
#X
var reactionX = 100
var dirX = 0
var newDirX = 0
var newDirTempoX = 0
var alvoDistX = 200
var velX = 650
#Y
var reactionY = 100
var dirY = 0
var newDirY = 0
var newDirTempoY = 0
var alvoDistY = -90
var velY = 450

func _ready():
	position = Vector2(1000, 1000)
	set_as_toplevel(true)
	pass 



func _physics_process(delta):
	add_to_group("Coringa")
	movimento_X()
	movimento_Y()
	move_and_slide(movimento, CIMA)
	
	
func movimento_X():

	if Jogador.position.x < position.x - alvoDistX:
		set_dir_X(-1)
	elif Jogador.position.x > position.x + alvoDistX:
		set_dir_X(1)
	else:
		set_dir_X(0)
		
	if OS.get_ticks_msec() > newDirTempoX:
		dirX = newDirX
		
	if dirX == 1 or dirX == -1:
		movimento.x = dirX * velX
	else:
		movimento.x = lerp(movimento.x, 0, atrito)
		
			
func set_dir_X(alvoX):
	if newDirX != alvoX:
		newDirX = alvoX
		newDirTempoX = OS.get_ticks_msec() + reactionX

func movimento_Y():

	if Jogador.position.y - 48 < position.y + alvoDistY:
		set_dir_Y(-1)
	elif Jogador.position.y - 48 > position.y - alvoDistY:
		set_dir_Y(1)
	else:
		set_dir_Y(0)
		
	if OS.get_ticks_msec() > newDirTempoY:
		dirY = newDirY
		
	if dirY == 1 or dirY == -1:
		movimento.y = dirY * velY
	else:
		movimento.y = lerp(movimento.y, 0, atrito)
		
			
func set_dir_Y(alvoY):
	if newDirY != alvoY:
		newDirY = alvoY
		newDirTempoY = OS.get_ticks_msec() + reactionY		

func set_texto(texto):
	get_node("BalaoTexto").set_texto(texto)
#func pulo():
#	if Input.is_action_pressed("Jump") && is_on_floor():
#		movimento.y -= puloVelocidade
#
#
#
	
#func gravidade():
#	if position.y > LIMMUNDO:
#		position = Vector2(0, 0)
#
#	if is_on_floor() and movimento.y > 0:
#		movimento.y = 0
#
#	if is_on_ceiling():
#		movimento.y = 0
#		movimento.y += GRAVIDADE
#	else: 
#		movimento.y += GRAVIDADE
	
	
	
	
	
