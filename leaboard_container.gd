extends HFlowContainer

@export var words : Array[LeaWord]
@export var is_common : bool = false

func _ready() -> void:
	for word : LeaWord in words:
		var button : LeaButton = LeaButton.new()
		button.word = word
		button.is_common = is_common
		add_child(button)
