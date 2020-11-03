extends Node2D

onready var textLabel = $Ancora/RichTextLabel

onready var textBG = $Ancora/ColorRect

const CHAR_TIME = 0.08
var margem = 0

func _ready():
	
	visible = false
	
	
func set_texto(texto, tempo = 3):
	visible = true
	
	$Timer.wait_time = tempo
	$Timer.stop()
	
	textLabel.bbcode_text = texto
	
	##Seta o tamanho do balao
	var tamanhoTexto = textLabel.get_font("normal_font").get_string_size(textLabel.text)
	textLabel.margin_right = tamanhoTexto.x + margem
	textBG.margin_right = tamanhoTexto.x + margem
	##Duração
	var duration = textLabel.text.length() * CHAR_TIME
	
	##Anim
	$Tween.remove_all()
	$Tween.interpolate_property(textLabel, "percent_visible", 0, 1, duration)
	$Tween.interpolate_property(textBG, "margin_right", 0, tamanhoTexto.x + margem, duration)
	$Tween.interpolate_property($Ancora, "position", Vector2.ZERO, Vector2(-tamanhoTexto.x/2, 0), duration)
	$Tween.start()
	dialogo()	
	
	
	

func dialogo():
	var roda
	var seletor
	roda = true
	randomize()	
	
	seletor = randi() % 4
	match seletor:
		0:
			$AudioStreamPlayer.stream = load("res://assets/Sons/Coroninha/Coroninha1.wav")
		1:
			$AudioStreamPlayer.stream = load("res://assets/Sons/Coroninha/Coroninha2.wav")
		2:
			$AudioStreamPlayer.stream = load("res://assets/Sons/Coroninha/Coroninha3.wav")
		3:
			$AudioStreamPlayer.stream = load("res://assets/Sons/Coroninha/Coroninha4.wav")
		4:
			$AudioStreamPlayer.stream = load("res://assets/Sons/Coroninha/Coroninha5.wav")
	$AudioStreamPlayer.play()	

func _on_Tween_tween_all_completed():
	$Timer.start()


func _on_Timer_timeout():
	visible = false


func _on_AudioStreamPlayer_finished():
	if $Tween.is_active():
		dialogo()
