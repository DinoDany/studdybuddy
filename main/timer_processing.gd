extends RichTextLabel

#Declare signals here
signal finished()	#Signal indicating timer has finished

# Declare member variables here
var s = 0
var m = 0
var h = 0
var started 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if h != 0:                      #If hours still left, then show hours and mins 
		set_bbcode("[center]"+str(h).pad_zeros(2)+":"+str(m).pad_zeros(2))		#set_text(str(h).pad_zeros(2)+":"+str(m).pad_zeros(2)+":"+str(s).pad_zeros(2))
	elif m!=0 or s>0:               #If no hours left, then show mins and secs
		set_bbcode("[center]"+str(m).pad_zeros(2)+":"+str(s).pad_zeros(2))		
	pass

func _on_Timer_timeout():
	s -= 1      #After timer node times out, decrease s by 1

	if s < 0:        #When seconds go beyond zero
		if m > 0:    #If minutes left, decrease minutes by 1 and seconds start from 59
			m -= 1
			s = 59
		elif h > 0:  #If no mins left but hours left, decrease hours by 1 and start mins/secs from 59
			h -= 1
			m = 59
			s = 59
		
	if h + m + s <= 0 and started == true:                      #If hours still left, then show hours and mins 
		started = false
		emit_signal("finished")     #Emit signal that the countdown has finished
		


func _on_Timer_passTimeValues(secs, mins, hours):  #Take variables from the previous screen
	s = secs
	m = mins
	h = hours
	
	started = true

