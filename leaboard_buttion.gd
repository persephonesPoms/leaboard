class_name LeaButton
extends Button

@export var word : LeaWord
@export var is_common : bool

func _ready() -> void:
	text = word.display_name
	custom_minimum_size.x = 32
	add_theme_font_size_override("font_size",24)

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			Controller.perm_panel.open(word)
			Controller.common = is_common
		elif event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			Controller.perm_panel.open(word)
			Controller.common = is_common
