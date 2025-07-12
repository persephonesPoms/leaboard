class_name PermutationButton
extends Button
@export var source_word : LeaWord

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			Controller.preview.add_text(text,source_word)
			Controller.perm_panel.close()
			if !Controller.common:
				if Controller.recents != null:
					Controller.recents.add_recent(source_word)
