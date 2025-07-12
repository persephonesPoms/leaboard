extends Control
@export var viewport_size : Vector2

func  _ready() -> void:
	get_tree().root.content_scale_size = viewport_size
