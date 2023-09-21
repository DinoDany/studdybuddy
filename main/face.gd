extends KinematicBody2D

onready var eyes_player = $Eyes/Eyes_player
onready var mouth_player = $Mouth/Mouth_player
onready var eyebrows_player = $Eyebrows/Eyebrows_player
var happy_mouth_toggle = true
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func sleep(sec):
	yield(get_tree().create_timer(sec), "timeout")

func _input(event):
	if event.is_action_pressed("A"):
		eyes_player.play("Idle_eyes")
	if event.is_action_pressed("S"):
		eyes_player.play("happy_eyes")
	if event.is_action_pressed("w"):
		if happy_mouth_toggle == true:
			mouth_player.play("happy_mouth")
			eyebrows_player.play("neutral2sad")
			yield(get_tree().create_timer(0.2), "timeout")
			eyes_player.play("happy_eyes")
			happy_mouth_toggle = false
			return
		if happy_mouth_toggle == false:
			mouth_player.play_backwards("happy_mouth")
			eyebrows_player.play_backwards("neutral2sad")
			eyes_player.play("normal_eyes")
			yield(get_tree().create_timer(0.5), "timeout")
			eyes_player.play("Idle_eyes")
			happy_mouth_toggle = true
			return
	if event.is_action_pressed("z"):
		mouth_player.play("idle_mouth")
		yield(get_tree().create_timer(0.15), "timeout")
		mouth_player.play_backwards("idle_mouth")
