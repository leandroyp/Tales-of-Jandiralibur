extends Node2D

export (PackedScene) var Mob
#onready var Mob = preload("res://Mob.tscn")


var labelX
var labelY
var monstersAlive
var monster


func _ready():
	for monster in range(3):
		var mob = Mob.instance()
		add_child(mob)
		
	
func MonsterLabel():
	monster.show()
	monster.MonsterHP.text = '-' + Global.heroDmg
	labelX = monster.position.x - 50
	labelY = monster.position.y - 100
	monster.MonsterHP.position.x = labelX
	monster.MonsterHP.position.y = labelY
	yield(get_tree().create_timer(2), "timeout")
	monster.hide()
	
	monstersAlive = len($Mob)


func _on_Button_button_down():
	for child in get_children():
		if child.name.find('Mob') != -1:
			print(child.name)
			child.input_pickable = true

	

