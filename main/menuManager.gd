extends Control

#Declare variables here
var s = 0
var m = 0
var h = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_menu_optionSelected():
	var oldMenu = $mainMenu
	oldMenu.visible = false
	var newMenu = $setCountdown
	newMenu.visible = true

func _on_setTimeValue_startTimer(s, m, h):
	var oldMenu = $setCountdown
	oldMenu.visible = false
	var newMenu = $Timer
	newMenu.visible = true
