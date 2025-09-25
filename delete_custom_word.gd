extends ConfirmationDialog


func _on_confirmed() -> void:
	Controller.remove_word()
