extends Control

# Declare signals here. 
signal startTimer(s,m,h)
signal returnPom(s,m,h)

# Declare member variables here. 
var mode = "timer"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HBoxContainer_menuClosed(s, m, h):
	if mode == "timer":                       #If it is in timer mode
		emit_signal("startTimer", s, m, h)
	else:                                     #If it is in pomodoro config mode
		emit_signal("returnPom", s, m, h)


func _on_pomodoro_inputTime():
	mode = "pomodoro"
