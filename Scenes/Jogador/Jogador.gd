extends KinematicBody2D

##Variáiveis movimentação
var movimento = Vector2(0, 0)
var velocidade = 50
var velocidadeMax = 1200
const GRAVIDADE = 190
const CIMA = Vector2(0, -1)
var puloVelocidade = 2950
const LIMMUNDO = 7000
var atrito = 0.185
var XLR8 = 100
var puloDuplo = true
##Variáveis
var cadencia
var dano = 1
var alcance
var projVel = 900
var dir = 1
var vida = 100


func _ready():
	position = Vector2(4000, 4000)
	pause_player()
	

func pause_player(boolean = false):
	self.set_process(boolean)
	self.set_physics_process(boolean)
	self.set_process_input(boolean)
	self.set_process_internal(boolean)
	self.set_process_unhandled_input(boolean)
	self.set_process_unhandled_key_input(boolean)

func unpause_player(boolean = true):
	self.set_process(boolean)
	self.set_physics_process(boolean)
	self.set_process_input(boolean)
	self.set_process_internal(boolean)
	self.set_process_unhandled_input(boolean)
	self.set_process_unhandled_key_input(boolean)
	
func _physics_process(delta):
	gravidade()
	movimento()
	pulo()
	move_and_slide(movimento, CIMA)
	bisturi()
	drop()	
	
func movimento():
	if Input.is_action_pressed("Left") && Input.is_action_pressed("Right"):
		movimento.x = 0
	elif Input.is_action_pressed("Left"):
		if movimento.x > -velocidadeMax:
			movimento.x -= XLR8
			dir = -1
		else:
			movimento.x = -velocidadeMax
	elif Input.is_action_pressed("Right"):
		if movimento.x < velocidadeMax:
			movimento.x += XLR8
			dir = 1
	else:
		movimento.x = lerp(movimento.x, 0, atrito)
	
func pulo():
	
	if Input.is_action_pressed("Jump") && is_on_floor() && not Input.is_action_pressed("Down"):
		$PuloSom.play()
		movimento.y -= puloVelocidade
		puloDuplo = true
	
	elif Input.is_action_just_pressed("Jump") && puloDuplo && not Input.is_action_pressed("Down"):
		movimento.y = 0
		puloDuplo = false
		movimento.y -= puloVelocidade
		$PuloSom.play()	
func drop():
	if Input.is_action_pressed("Down") && Input.is_action_pressed("Jump"):
			set_collision_mask_bit(2, false)
			$PuloSom.play()
	
	
func gravidade():
	if position.y > LIMMUNDO:
		position = Vector2(-48, -352)
		
	if is_on_floor() and movimento.y > 0:
		movimento.y = 0
		
	if is_on_ceiling():
		movimento.y = 0
		movimento.y += GRAVIDADE
	else: 
		movimento.y += GRAVIDADE
	
func bisturi():
	if Input.is_action_just_pressed("Fire"):
		$TiroSom.play()
		var bisturi = load("res://Scenes/Jogador/Bisturi.tscn").instance()
		bisturi.projVel = projVel * dir
		bisturi.dano = dano
		add_child(bisturi)

func sangue():
	vida += vida / 2	
	
func dano(dano):
	$DanoSom.play()
	vida -= dano
	if vida <= 0:
		print("ded")
		


func _on_Area2D_body_exited(body):
	set_collision_mask_bit(2, true)
