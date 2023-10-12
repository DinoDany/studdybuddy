extends Control

# Declare signals here
signal passTimeValues(secs, mins, hours)
signal returnToMain()
signal showMessage()

# Declare member variables here
var mode

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_setCountdown_startTimer(s, m, h):
	emit_signal("passTimeValues", s, m, h)
	mode = "timer"
	
func _on_pomodoro_startPomodoro(s_pom, m_pom, h_pom):
	emit_signal("passTimeValues", s_pom, m_pom, h_pom)
	mode = "pomodoro"

func _on_TextDisplayer_finished():            #When timer finishes, return to idle screen. Note: Might change to visibility instead
	if mode == "timer":
		get_tree().change_scene("res://idle.tscn")
	elif mode == "pomodoro":
		emit_signal("showMessage")
	#emit_signal("returnToMain")

func _on_TextureButton_pressed():             #When the return button is pressed, go back to main menu but keep the countdown running in the background
	emit_signal("returnToMain")


