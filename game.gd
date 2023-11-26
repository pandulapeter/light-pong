extends Node3D

var leftScore = 0
var rightScore = 0

func _ready():
	update_scores()

func _process(delta):
	if Input.is_action_just_pressed("ui_close"):
		get_tree().quit()
	if Input.is_action_pressed("player_left_move_up"):
		$PaddleLeft.move_up(delta)
	if Input.is_action_pressed("player_left_move_down"):
		$PaddleLeft.move_down(delta)
	if Input.is_action_pressed("player_right_move_up"):
		$PaddleRight.move_up(delta)
	if Input.is_action_pressed("player_right_move_down"):
		$PaddleRight.move_down(delta)
	$Camera.look_at($Ball.global_position.lerp($Ball.start_position, 0.8))
	$SpotLightBall.look_at($Ball.global_position)

func update_scores():
	$LeftScoreLabel.text = str(leftScore)
	$RightScoreLabel.text = str(rightScore)

func _on_ball_ball_lost(isLeftBall):
	if isLeftBall:
		leftScore +=1
	else:
		rightScore += 1
	update_scores()
