extends Control

signal optionSelected(selected)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TimerButton_pressed():
	emit_signal("optionSelected", "timer")


func _on_PomodoroButton_pressed():
	emit_signal("optionSelected", "pomodoro")
