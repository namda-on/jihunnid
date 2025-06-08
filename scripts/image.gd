extends Node

@onready var start_text = $start
@onready var loading_text = $loading
@onready var outline_red = $"outline-red"
@onready var infinite = $infinite
@onready var outline_lg = $"outline-lg"

func show_result() -> void:
	print("switch Scene")
	loading_text.visible = false
	outline_red.visible = false
	infinite.visible = true
	outline_lg.modulate = Color(1,1,1,1)
	var anim_player = get_parent().get_node("AnimationPlayer")
	anim_player.play("showResult")	
	
func reset() -> void:
	var anim_player = get_parent().get_node("AnimationPlayer")
	anim_player.play("RESET")	
	#start_text.visible = true
	#start_text.modulate = Color(1,1,1,1)
	#loading_text.visible = false
	#outline_red.visible = false
	#infinite.visible = false
	#get_parent().disabled = false
