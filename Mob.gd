extends Area2D

var actualFloorLevel
var mob
var mobLevel

var mobHp
var mobDmg
var mobXpGiven

var multiplierHp
var multiplierDmg
var multiplierXpGiven

func _ready():
	$MonsterHP.hide()
	randomize()
	actualFloorLevel = Global.floorLevel # Andar atual
	mob = Global.mobsOnFloors[actualFloorLevel][randi() % 3] # Tipo do mob
	mobLevel = Global.mobLevelsOnFloors[actualFloorLevel][randi() % 6] # Nível do mob
	$Sprite.animation = mob
	
	# Multiplicadores
	multiplierHp = Global.mobs[mob][0]
	multiplierDmg = Global.mobs[mob][1]
	multiplierXpGiven = Global.mobs[mob][2]
	
	#Status
	mobHp = floor(multiplierHp * (mobLevel * 3 + actualFloorLevel * 2)) 
	mobDmg = floor(multiplierDmg * (mobLevel * 1.5 + actualFloorLevel))
	mobXpGiven = floor(multiplierXpGiven * (actualFloorLevel + mobLevel))
	
func DeathAnimation():
	queue_free()
	pass