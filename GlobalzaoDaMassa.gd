extends Node

var floorLevel = 1
var xp = 0
var xpNeeded = 25
var heroHp = 25
var heroDmg = 5
var heroLevel = 1

# Dicionário dos mobs:
# Multipliers de HP, DANO e XP
var mobs = {
	'Bat': [1, 1, 1]
	}


# Bat = 1
var mobsOnFloors = {
	1: ['Bat', 'Bat', 'Bat'],
	2: ['Bat', 'Bat', 'Bat'],
	3: ['Bat', 'Bat', 'Bat'],
	}
	
var mobLevelsOnFloors = {
	1: [1, 1, 1, 1, 2, 2],
	2: [1, 1, 2, 2, 3, 3],
	3: [2, 2, 3, 3, 3, 3],
	4: [5, 5, 5, 5, 5, 5]
	}
	
var startPositionsBat = [
[150, 275],
[225, 350],
[150, 425]
]
 
	
func _ready():
	pass

	