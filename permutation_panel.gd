extends PanelContainer

var base_permutation_edit : PackedScene = load("res://permutation_edit.tscn")

func _ready() -> void:
	Controller.perm_panel = self

func _on_close_pressed() -> void:
	close()

func close() -> void:
	hide()

func clear_contents() -> void:
	for child : Control in $VBoxContainer.get_children():
		if child is Button or child is PermEdit:
			child.queue_free()

func customization_open() -> void:
	$VBoxContainer/HBoxContainer/Delete.hide()
	$VBoxContainer/HBoxContainer/Confirm.show()
	show()
	clear_contents()
	var new_permutation_edit = base_permutation_edit.instantiate()
	new_permutation_edit.get_node("Button2").hide()
	$VBoxContainer.add_child(new_permutation_edit)

func open(word:LeaWord) -> void:
	show()
	Controller.current_word = word
	clear_contents()
	
	if word.custom : $VBoxContainer/HBoxContainer/Delete.show()
	else: $VBoxContainer/HBoxContainer/Delete.hide()
	$VBoxContainer/HBoxContainer/Confirm.hide()
	
	for permutation :String in word.permutations:
		var new_button : PermutationButton = PermutationButton.new()
		new_button.text = permutation
		new_button.source_word = word
		$VBoxContainer.add_child(new_button)

func _on_confirm_pressed() -> void:
	var new_word_name := ""
	var new_word_permutations : Array[String] = []
	for child in $VBoxContainer.get_children():
		if child is PermEdit:
			var permutation_text = child.get_node("LineEdit").text
			if permutation_text == "":
				return
			if new_word_name == "":
				new_word_name = permutation_text
			new_word_permutations.push_back(permutation_text)
	var new_word : LeaWord = LeaWord.new()
	new_word.display_name = new_word_name
	new_word.permutations = new_word_permutations
	new_word.custom = true
	Controller.add_word(new_word)
	close()


func _on_delete_pressed() -> void:
	close()
	get_parent().get_node("ConfirmationDialog").popup_centered()
