class_name PermEdit
extends HBoxContainer

var perm_edit :PackedScene= load("res://permutation_edit.tscn")

func _on_button_pressed() -> void:
	get_parent().add_child(perm_edit.instantiate())


func _on_button_2_pressed() -> void:
	queue_free()
