extends KinematicBody2D

onready var eyes_player = $Eyes/Eyes_player
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if event.is_action_pressed("A"):
		eyes_player.play("Idle_eyes")
	if event.is_action_pressed("S"):
		eyes_player.play("happy_eyes")
		
