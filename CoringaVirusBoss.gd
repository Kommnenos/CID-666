extends KinematicBody2D

var divisaoNum
var vidas
var movimento
var speed = 750
var velocity = Vector2(500, -500)
var vida = 10

const CIMA = Vector2(0, -1)

func _ready():
	randomise_velocity()
	add_to_group("Boss")

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
		if collision.collider.has_method("hit"):
			collision.collider.hit()

func dano(dano_recebido):
	$DanoSom.play()
	vida -= dano_recebido
	if vida <= 0:
		mitose()
	
func mitose():
	
	var filha1 = load("res://Scenes/Enimigos/BOSS/CoringaVirusBoss.tscn").instance()
	var filha2 = load("res://Scenes/Enimigos/BOSS/CoringaVirusBoss.tscn").instance()
	
	filha1.scale = self.scale / 2
	filha2.scale = self.scale / 2
	var alvo = position
	filha1.global_position = global_position
	filha2.global_position = global_position
	
	get_parent().add_child(filha1)
	get_parent().add_child(filha2)
	filha1.get_node("SeparaSom").play()
	queue_free()
	






func randomise_velocity():
	randomize()
	velocity.x += rand_range(-200, +200)
	velocity.y += rand_range(-200, +200)
	

func _on_Randomiser_timeout():
	randomise_velocity()	


func _on_TimerSom_timeout():
	$LoopSom.play()
	$TimerSom.wait_time = rand_range(5, 15)
	$TimerSom.start()
	
