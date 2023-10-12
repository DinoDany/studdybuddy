extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _enter_tree():
	set_bbcode("[center]Touch to enter study time")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Control_changeMessage(stage):
	if stage == 1:
		set_bbcode("[center]Touch to enter resting time")
	elif stage == 2:
		set_bbcode("[center]Touch to start studying ^^")
	elif stage == 3:
		set_bbcode("[center]Touch to rest")
