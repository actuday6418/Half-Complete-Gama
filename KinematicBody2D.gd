extends KinematicBody2D

var motion = Vector2()
const UP = Vector2(0,-1)
var signal = "IL"


func _physics_process(delta):
	
	
		
	if Input.is_action_just_pressed("ui_select") and is_on_floor(): 
		motion.y = -700
		if signal == "IL" or signal == "RL":
			$PlayerSprite.play("JumpLeft")
			signal = "JL"
		else:
			$PlayerSprite.play("JumpRight")
			signal = "JR"
	elif !is_on_floor():
		motion.y+=10
				
	if Input.is_action_pressed("ui_right"):
		if motion.x < 300: 
			motion.x += 20
		if is_on_floor() and motion.y > 0:
			$PlayerSprite.play("RunRight")
			signal = "RR"
		
	elif Input.is_action_pressed("ui_left"):
		if motion.x > -300:
			motion.x += -20
		if is_on_floor() and motion.y > 0:
			$PlayerSprite.play("RunLeft")
			signal = "RL"
	else:
		motion.x = 0
		if signal == "RR" or signal == "JR" or signal == "IR":
			if motion.y > 0 and is_on_floor():
				$PlayerSprite.play("IdleRight")
				signal = "IR"
		else:
			if motion.y > 0 and is_on_floor():
				$PlayerSprite.play("IdleLeft")
				signal = "IL"
			
		
	if !is_on_floor():
				motion.y += 10
	#else:
		#motion.y = 0
	
	
	move_and_slide(motion , UP)
	pass
