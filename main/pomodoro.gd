extends Control

# Declare signals here.
signal inputTime()
signal changeMessage(stage)
signal startPomodoro(s_pom, m_pom, h_pom)

# Declare member variables here
var s_study
var m_study
var h_study
var s_break
var m_break
var h_break
var stage = 0 #Defines the step of the pomodoro ==> 0: Welcome and enter study time, 1: Pomodoro enter rest time, 
			  #2: Pomodoro start study time, 3:Pomodoro start rest time

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextDisplayer_gui_input(event):
	#When clicked, change scene to setCountdown
	if event is InputEventMouseButton:
	#if event.button_index == BUTTON_LEFT and event.pressed:
		if stage < 2:
			emit_signal("inputTime")
		elif stage == 2:
			emit_signal("startPomodoro", s_study, m_study, h_study)
		elif stage == 3:
			emit_signal("startPomodoro", s_break, m_break, h_break)

func _on_setCountdown_returnPom(s, m, h):
	if stage == 0:
		s_study = s
		m_study = m
		h_study = h
		stage = 1
	elif stage == 1:
		s_break = s
		m_break = m
		h_break = h
		stage = 2
	
	emit_signal("changeMessage", stage)

func _on_timer_showMessage():
	if stage == 2:
		stage = 3
	elif stage == 3:
		stage = 2
	emit_signal("changeMessage", stage)


func _on_Control_inputTime():
	pass # Replace with function body.
