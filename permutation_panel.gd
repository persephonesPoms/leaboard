extends PanelContainer

func _ready() -> void:
	Controller.perm_panel = self


func _on_close_pressed() -> void:
	close()

func close() -> void:
	hide()

func clear_contents() -> void:
	for child : Control in $VBoxContainer.get_children():
		if child is Button:
			child.queue_free()

func open(word:LeaWord) -> void:
	show()
	clear_contents()
	for permutation :String in word.permutations:
		var new_button : PermutationButton = PermutationButton.new()
		new_button.text = permutation
		new_button.source_word = word
		$VBoxContainer.add_child(new_button)
