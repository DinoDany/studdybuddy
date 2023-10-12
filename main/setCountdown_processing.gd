extends HBoxContainer

signal menuClosed(s,m,h)

# Declare member variables here. Examples:
var s = 0
var m = 0
var h = 0
var selected = "mins"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	get_node("Hours").bbcode_text   = "[center]" + str(h)
	get_node("Minutes").bbcode_text = "[center]" + str(m).pad_zeros(2)
	get_node("Seconds").bbcode_text = "[center]" + str(s).pad_zeros(2)
	pass

func _on_Hours_gui_input(event):
	#When clicked, change selected time unit
	if event is InputEventMouseButton:
		selected = "hours"
	pass

func _on_Minutes_gui_input(event):
	#When clicked, change selected time unit
	if event is InputEventMouseButton:
		selected = "minutes"
	pass 

func _on_Seconds_gui_input(event):
	#When clicked, change selected time unit
	if event is InputEventMouseButton: 
		selected = "secs"
	pass 


func _on_IncreaseButton_pressed():
	#Increase the value selected by 1
	if selected == "hours":
		if h < 71:
			h += 1 
		else:
			h = 0
	elif selected == "secs":
		s += 1
	else:
		m += 1
	
	#When seconds reach 60, add a minute
	if s >= 60:
		s = 0
		m += 1
	
	#When minutes reach 60, add an hour (cannot pass the limit)
	if m >= 60:
		m = 0
		if h < 71:
			h += 1
			
	pass

func _on_DecreaseButton_pressed():
	#Decrease the value selected by 1
	if selected == "hours":
		if h > 0:
			h -= 1
		else:
			h = 71
	elif selected == "secs":
		s -= 1
	else:
		m -= 1
	
	#When seconds are lower than 0, substract a minute and reset to 59
	if s < 0:
		s = 59
		m -= 1
		
	#When minutes are lower than 0, substract an hour and reset to 59
	if m < 0:
		m = 59
		if h > 0:
			h -= 1
	pass


func _on_TextureButton_pressed():
	emit_signal("menuClosed", s, m, h)
