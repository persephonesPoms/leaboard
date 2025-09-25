extends Node

var preview : LineEdit
var perm_panel : PanelContainer
var data : BoardData
var recents : HFlowContainer
var common := false
var customset : Wordset
var current_word : LeaWord
var custom_panel : CustomWordSet

func _ready():
	if OS.has_feature("web_android") or OS.has_feature("web_ios") or OS.has_feature("mobile"):
		pass
	if !ResourceLoader.exists("user://board_data.tres"):
		data = BoardData.new()
	else: data = ResourceLoader.load("user://board_data.tres")
	if !DirAccess.dir_exists_absolute("user://custom_words"):
		DirAccess.make_dir_absolute("user://custom_words")
	if !ResourceLoader.exists("user://custom_words/wordset.tres"):
		customset = Wordset.new()
	else:
		customset = ResourceLoader.load("user://custom_words/wordset.tres")

func save():
	ResourceSaver.save(data,"user://board_data.tres")
	ResourceSaver.save(customset,"user://custom_words/wordset.tres")

func remove_word():
	if customset.words.has(current_word):
		customset.words.erase(current_word)
	for child in custom_panel.get_node("VBoxContainer/HFlowContainer").get_children():
		if child is LeaButton:
			if child.word == current_word:
				child.queue_free()
	save()

func add_word(word:LeaWord):
	customset.words.append(word)
	var button : LeaButton = LeaButton.new()
	button.word = word
	button.is_common = true
	custom_panel.get_node("VBoxContainer/HFlowContainer").add_child(button)
	save()
