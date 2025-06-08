extends Node

@onready var start_text = $start
@onready var loading_text = $loading
@onready var outline_red = $"outline-red"
@onready var infinite = $infinite
@onready var outline_lg = $"outline-lg"
@onready var anim_player = get_parent().get_node("AnimationPlayer")

var mode = 'ready'

func show_reveal() -> void:
	print("show reveal")
	mode = 'reveal'
	anim_player.play("reveal")

func show_result() -> void:
	mode = "result"
	loading_text.visible = false
	outline_red.visible = false
	infinite.visible = true
	outline_lg.modulate = Color(1,1,1,1)
	anim_player.play("showResult")	
	
func reset() -> void:
	anim_player.play("RESET")
	start_text.visible = true
	start_text.modulate = Color(1,1,1,1)
	loading_text.visible = false
	outline_red.visible = false
	infinite.visible = false
	get_parent().disabled = false
	mode="ready"
	
