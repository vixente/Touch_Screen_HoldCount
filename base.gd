extends Node2D

var red_pressed = false
var blue_pressed = false
var yellow_pressed = false
var red_timelapse = 0
var blue_timelapse = 0
var yellow_timelapse = 0
@onready var red_label_settings = $"Label Base/State/Red Label".get_label_settings()
@onready var blue_label_settings = $"Label Base/State/Blue Label".get_label_settings()
@onready var yellow_label_settings = $"Label Base/State/Yellow Label".get_label_settings()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if red_pressed:
		$"Label Base/State/Red Label".text = "PRESSED"
		red_timelapse += delta
	else:
		$"Label Base/State/Red Label".text = "RELEASED"
		red_timelapse = 0
		
	if blue_pressed:
		$"Label Base/State/Blue Label".text = "PRESSED"
		blue_timelapse += delta
	else:
		$"Label Base/State/Blue Label".text = "RELEASED"
		blue_timelapse = 0	
	
	if yellow_pressed:
		$"Label Base/State/Yellow Label".text = "PRESSED"
		yellow_timelapse += delta
	else:
		$"Label Base/State/Yellow Label".text = "RELEASED"
		yellow_timelapse = 0
	
	# Update timelapse labels if it has to be done.
	
	if red_timelapse > 0:
		$"Label Base/Timers/Red Timer Label".text = var_to_str(red_timelapse) + " s."
	else:
		$"Label Base/Timers/Red Timer Label".text = ""
	
	if blue_timelapse > 0:
		$"Label Base/Timers/Blue Timer Label".text = var_to_str(blue_timelapse) + " s."
	else:
		$"Label Base/Timers/Blue Timer Label".text = ""
	
	if yellow_timelapse > 0:
		$"Label Base/Timers/Yellow Timer Label".text = var_to_str(yellow_timelapse) + " s."
	else:
		$"Label Base/Timers/Yellow Timer Label".text = ""
		
	
	# CHECK IF ANY TIMELAPSE REACHED 2 SECS

	
	if red_timelapse >= 2.0:
		red_label_settings.font_color = Color.GREEN
		#$"Label Base/State/Red Label".label_settings.font_color = 0x00bb00
	else:
		red_label_settings.font_color = Color.WHITE
		#$"Label Base/State/Red Label".label_settings.font_color = 0xffffff
	
	if blue_timelapse >= 2.0:
		#$"Label Base/State/Blue Label".label_settings.font_color = 0x00bb00
		blue_label_settings.font_color = Color.GREEN
	else:
		blue_label_settings.font_color = Color.WHITE
		#$"Label Base/State/Blue Label".label_settings.font_color = 0xffffff
	
	if yellow_timelapse >= 2.0:
		yellow_label_settings.font_color = Color.GREEN
		#$"Label Base/State/Yellow Label".label_settings.font_color = 0x00bb00
	else:
		yellow_label_settings.font_color = Color.WHITE
		#$"Label Base/State/Yellow Label".label_settings.font_color = 0xffffff
		
		
		
	
#### SIGNALS ####

#### TOUCH SCREEN ####
func _on_red_touch_screen_button_pressed():
	red_pressed = true

func _on_blue_touch_screen_button_pressed():
	blue_pressed = true

func _on_yellow_touch_screen_button_pressed():
	yellow_pressed = true

func _on_red_touch_screen_button_released():
	red_pressed = false

func _on_blue_touch_screen_button_released():
	blue_pressed = false

func _on_yellow_touch_screen_button_released():
	yellow_pressed = false

#### MOUSE BUTTON ####

func _on_red_button_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		var e = event as InputEventMouseButton
		if e.pressed:
			red_pressed = true
		else:
			red_pressed = false

func _on_blue_button_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		var e = event as InputEventMouseButton
		if e.pressed:
			blue_pressed = true
		else:
			blue_pressed = false

func _on_yellow_button_area_2d_2_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		var e = event as InputEventMouseButton
		if e.pressed:
			yellow_pressed = true
		else:
			yellow_pressed = false
