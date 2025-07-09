extends HFlowContainer

var recents : Array[LeaWord]


func _ready() -> void:
	Controller.recents = self
	await(get_tree().process_frame)
	recents = Controller.data.recents
	list()

func add_recent(word:LeaWord) -> void:
	if recents.has(word):
		recents.erase(word)
	recents.push_front(word)
	if recents.size() > 40:
		recents.pop_back()
	list()

func list() -> void:
	Controller.data.recents = recents
	for child:Node in get_children():
		child.queue_free()
	for word:LeaWord in recents:
		var new_button = LeaButton.new()
		new_button.word = word
		add_child(new_button)
	Controller.save()
