extends RichTextLabel

#Declare signals
signal finished()	#Signal indicating timer has finished

# Declare member variables here. Examples:
var s = 10
var m = 1
var h = 0
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if s < 0:	#when seconds go beyond zero
		if m > 0:	#if there are minutes left, substract a minutes and seconds start from 60
			m -= 1
			s = 59
		elif h > 0:
			h -= 1
			m = 59
			s = 59
	
	if h != 0:
		set_bbcode("[center]"+str(h).pad_zeros(2)+":"+str(m).pad_zeros(2))
		#set_text(str(h).pad_zeros(2)+":"+str(m).pad_zeros(2)+":"+str(s).pad_zeros(2))
	elif m!=0 or s>0:
		set_bbcode("[center]"+str(m).pad_zeros(2)+":"+str(s).pad_zeros(2))
	else:
		set_bbcode("[center]Timer has ended")
		emit_signal("finished")
	pass



func _on_Timer_timeout():
	s -= 1
	pass # Replace with function body.


func _on_Timer_passTimeValues(secs, mins, hours):
	s = secs
	m = mins
	h = hours
