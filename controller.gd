extends Node

var preview : LineEdit
var perm_panel : PanelContainer
var data : BoardData
var recents : HFlowContainer
var common := false

func _ready():
	if OS.has_feature("web_android") or OS.has_feature("web_ios") or OS.has_feature("mobile"):
		pass
	if !ResourceLoader.exists("user://board_data.tres"):
		data = BoardData.new()
	else: data = ResourceLoader.load("user://board_data.tres")

func save():
	ResourceSaver.save(data,"user://board_data.tres")
