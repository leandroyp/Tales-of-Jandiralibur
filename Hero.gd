extends Area2D

var classe
var hp
var dano
var nivel
var equipamento
#var posicaoVetorial = Vector2()
var screen_size
var speed = 400
var right
var left
var up
var down

func _ready():
	screen_size = get_viewport_rect().size
	nivel = 1
	if classe == "guerreiro":
		hp = 30
		dano = 5
		equipamento = "espada"
		
		
func _input(event):
	if Input.is_action_just_pressed("ui_right"):
		right = true
		$Tween.interpolate_method(self, "andar", position.x, position.x + 100, 0.5, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
		yield($Tween, "tween_completed")
		right = false
		
	if Input.is_action_pressed("ui_left"):
		left = true
		$Tween.interpolate_method(self, "andar", position.x, position.x - 100, 0.5, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
		yield($Tween, "tween_completed")
		left = false
		
	if Input.is_action_pressed("ui_up"):
		up = true
		$Tween.interpolate_method(self, "andar", position.y, position.y - 100, 0.5, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
		yield($Tween, "tween_completed")
		up = false
		
	if Input.is_action_pressed("ui_down"):
		down = true
		$Tween.interpolate_method(self, "andar", position.y, position.y + 100, 0.5, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
		yield($Tween, "tween_completed")
		down = false
		
	position.x = clamp(position.x, 50, screen_size.x - 50)
	position.y = clamp(position.y, 50, screen_size.y - 50)

#	var velocity = Vector2()
#	if Input.is_action_pressed("ui_right"):
#		velocity.x += 1
#
#	if Input.is_action_pressed("ui_left"):
#		velocity.x -= 1
#
#	if Input.is_action_pressed("ui_up"):
#		velocity.y -= 1
#
#	if Input.is_action_pressed("ui_down"):
#		velocity.y += 1
#
#	if velocity.length () > 0:
#		velocity = velocity.normalized() * speed
#
#	position += velocity * delta
#	position.x = clamp(position.x, 50, screen_size.x - 50)
#	position.y = clamp(position.y, 50, screen_size.y - 50)
	
func andar(valor):
	if (right or left) == true:
		position.x = valor
	if (up or down) == true:
		position.y = valor

		



