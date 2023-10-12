extends Control

#Declare variables here
var s = 0
var m = 0
var h = 0
var oldMenu
var newMenu
var mode

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

###############################################
# Common scenes
###############################################
func _on_mainMenu_optionSelected(selected):
	mode = selected
	oldMenu = $mainMenu
	if mode == "timer":
		newMenu = $setCountdown
	elif mode == "pomodoro":
		newMenu = $pomodoro
	oldMenu.visible = false
	newMenu.visible = true

func _on_setCountdown_startTimer(s, m, h):
	oldMenu = $setCountdown
	newMenu = $timer
	oldMenu.visible = false
	newMenu.visible = true

func _on_setCountdown_returnPom(s, m, h):
	oldMenu = $setCountdown
	newMenu = $pomodoro
	oldMenu.visible = false
	newMenu.visible = true
	
###############################################
# Specific scenes
###############################################
func _on_Timer_returnToMain():
	oldMenu = $timer
	newMenu = $mainMenu
	oldMenu.visible = false
	newMenu.visible = true

func _on_pomodoro_inputTime():
	oldMenu = $pomodoro
	newMenu = $setCountdown
	oldMenu.visible = false
	newMenu.visible = true

func _on_pomodoro_startPomodoro(s_pom, m_pom, h_pom):
	oldMenu = $pomodoro
	newMenu = $timer
	oldMenu.visible = false
	newMenu.visible = true

func _on_timer_showMessage():
	oldMenu = $timer
	newMenu = $pomodoro
	oldMenu.visible = false
	newMenu.visible = true



