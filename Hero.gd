extends KinematicBody2D

var playerPivotPos
var playerStartPos

func AttackAnimation(monster):
	playerStartPos = $Sprite.position
	if monster.mob == "Bat":
		$Tween.interpolate_method($Sprite, "position", $Sprite.position, 
		Vector2(monster.position.x + 50, monster.position.y - 100), 
		1.5, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		yield($Tween, "tween_completed") #tenta tirar esse yield depois
		#playerPivotPos = $Sprite.position.y - monster.position.y
		
		$Tween.interpolate_method($Sprite, "rotation", 0, 90, 1, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		yield($Tween, "tween_completed")
		
		$Sprite.flip_h = true
		$Tween.interpolate_method($Sprite, "rotation", 90, 0, 1, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		yield($Tween, "tween_completed")
		
		$Tween.interpolate_method($Sprite, "position", $Sprite.position, 
		playerStartPos, 1.5, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		yield($Tween, "tween_completed")
		$Sprite.flip_h = false
		






