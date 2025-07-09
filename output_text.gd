extends LineEdit

func  _ready() -> void:
	Controller.preview = self


func _on_clipboard_button_pressed() -> void:
	DisplayServer.clipboard_set("\\[" + text + "\\]")


func _on_clear_pressed() -> void:
	text = ""

var nospace_next := false
var caps := false

func add_text(text_to_add:String,word:LeaWord) -> void:
	if text == "" or "!?.".containsn(text[text.length()-1]):
		text_to_add = text_to_add.capitalize()
	
	if caps: text_to_add = text_to_add.to_upper()
	
	if text != "" and not (word.nospace_before or nospace_next):
		text += " "
	
	text += text_to_add
	nospace_next = word.nospace_after


func _on_check_button_toggled(toggled_on: bool) -> void:
	caps = toggled_on
