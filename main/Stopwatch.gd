extends RichTextLabel


# Declare member variables here. Examples:
var s = 0
var m = 0
var h = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if s > 59:
		m += 1
		s = 0
	
	if m > 59:
		h += 1
		m = 0
		
	if h != 0:
		set_bbcode("[center]"+str(h).pad_zeros(2)+":"+str(m).pad_zeros(2))
		#set_text(str(h).pad_zeros(2)+":"+str(m).pad_zeros(2)+":"+str(s).pad_zeros(2))
	else:
		set_bbcode("[center]"+str(m).pad_zeros(2)+":"+str(s).pad_zeros(2))
	
	pass



func _on_Timer_timeout():
	s += 1
	pass # Replace with function body.
