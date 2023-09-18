extends Control

signal passTimeValues(secs, mins, hours)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_setTimeValue_startTimer(s, m, h):
	emit_signal("passTimeValues", s, m, h)

func _on_TextDisplayer_finished():
	pass # Replace with function body.
