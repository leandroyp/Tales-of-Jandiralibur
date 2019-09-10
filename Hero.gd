extends KinematicBody2D

var playerPivotPos
var playerStartPos
var hpLabel

var hpMonster

var hpMonster2

var hpMonster3

func AttackAnimation(monster):
	playerStartPos = $Position2D.position
	$Tween.start()
	if monster.mob == "Bat":
		#$Tween.interpolate_method(self, "positionHero", position.x, position.x - 300, 3, Tween.TRANS_BOUNCE, Tween.EASE_OUT)
		$Tween.interpolate_method(self, "positionHero", position, 
		Vector2(monster.position.x + 100, monster.position.y + 100), 
		0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		#yield($Tween, "tween_completed") #tenta tirar esse yield depois
		#playerPivotPos = $Sprite.position.y - monster.position.y

		$Tween.interpolate_method(self, "rotationHero", 0, -90, 0.3, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		yield($Tween, "tween_completed")
		mobHit(monster)
		hpdown(monster)

		# Animação da Label
		$Tween.interpolate_method(self, "positionLabel", hpLabel.rect_position.y, hpLabel.rect_position.y - 40, 1.5, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.interpolate_property(hpLabel, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 2, Tween.TRANS_LINEAR, Tween.EASE_IN)
		yield($Tween, "tween_completed")
		
		$Tween.interpolate_method(self, "rotationHero", -90, 0, 0.3, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		yield($Tween, "tween_completed")
		
		
		$Tween.interpolate_method(self, "positionHero", position, 
		playerStartPos, 1, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Sprite.flip_h = true
		yield(get_tree().create_timer(1), "timeout")
		$Sprite.flip_h = false


func positionHero(value):
	position = value
	
	
func positionLabel(value):
	hpLabel.rect_position.y = value
	
	
func rotationHero(value):
	$Sprite.rotation_degrees = value
	print(value)


func hpdown(monster):
	hpMonster = get_parent().get_node("HUD_Combat/HUD_Combat_Monster/MonsterHP1")
	hpMonster2 = get_parent().get_node("HUD_Combat/HUD_Combat_Monster/MonsterHP2")
	hpMonster3 = get_parent().get_node("HUD_Combat/HUD_Combat_Monster/MonsterHP3")
	
	if monster.id == "First":
		hpMonster.max_value = monster.mobMaxHP
		hpMonster.value = monster.mobHp
		
	if monster.id == "Second":
		hpMonster2.max_value = monster.mobMaxHP
		hpMonster2.value = monster.mobHp
		
	if monster.id == "Third":
		hpMonster3.max_value = monster.mobMaxHP
		hpMonster3.value = monster.mobHp

func mobHit(monster):
		monster.mobHp -= Global.heroDmg
		if monster.mobHp < 0:
			monster.mobHp = 0
		
		if monster.mobHp == 0:
			monster.DeathAnimation()
		
		hpLabel = monster.get_child(2)# SE DER MERDA COM INDICE É AQUI QUE RESOLVE
		hpLabel.show()
		hpLabel.text = str(Global.heroDmg) 

