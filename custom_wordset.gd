class_name CustomWordSet
extends ScrollContainer


func _ready() -> void:
	var customset = Controller.customset
	for word : LeaWord in customset.words:
		var button : LeaButton = LeaButton.new()
		button.word = word
		button.is_common = true
		$VBoxContainer/HFlowContainer.add_child(button)
	
	Controller.custom_panel = self


func _on_create_pressed() -> void:
	Controller.perm_panel.customization_open()
