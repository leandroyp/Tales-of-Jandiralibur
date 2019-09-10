extends Area2D
export (PackedScene) var Main


var actualFloorLevel
var mob
var mobLevel

var mobHp
var mobDmg
var mobXpGiven
var mobMaxHP

var multiplierHp
var multiplierDmg
var multiplierXpGiven

var id

func _ready():
	input_pickable = false
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
	
	# Status
	mobHp = floor(multiplierHp * (mobLevel * 3 + actualFloorLevel * 2)) 
	mobDmg = floor(multiplierDmg * (mobLevel * 1.5 + actualFloorLevel))
	mobXpGiven = floor(multiplierXpGiven * (actualFloorLevel + mobLevel))
	mobMaxHP = floor(multiplierHp * (mobLevel * 3 + actualFloorLevel * 2)) 
	
	# Posição de spawn
	position.x = Global.startPositionsBat[0][0]
	position.y = Global.startPositionsBat[0][1]
	Global.startPositionsBat.pop_front()
	
	# ID dos Mobs
	id = Global.idMobs[0] 
	Global.idMobs.pop_front()

func DeathAnimation():
	$Sprite.hide()
	yield(get_tree().create_timer(2), "timeout")
	queue_free()
	pass


func _on_Mob_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("ui_mouse1"):
			get_parent().get_node('Hero').AttackAnimation(self)

