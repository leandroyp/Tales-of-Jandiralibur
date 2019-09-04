extends Node2D

export (PackedScene) var Mob
#onready var Mob = preload("res://Mob.tscn")

var labelX
var labelY
var monstersAlive

func _ready():
	for monster in range(3):
		var mob = Mob.instance()
		add_child(mob)
	
	
func _on_MonsterButton_pressed(monster):
	monster.mobHp -= Global.heroDmg
	if monster.mobHp < 0:
		monster.mobHp = 0
		
	if monster.mobHp == 0:
		monster.DeathAnimation()
	
	monster.show()
	monster.MonsterHP.text = '-' + Global.heroDmg
	labelX = monster.position.x - 50
	labelY = monster.position.y - 100
	monster.MonsterHP.position.x = labelX
	monster.MonsterHP.position.y = labelY
	yield(get_tree().create_timer(2), "timeout")
	monster.hide()
	
	monstersAlive = len($Mob)

		
		

	