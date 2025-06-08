extends Node

@onready var start_text = $start
@onready var loading_text = $loading
@onready var outline_red = $"outline-red"
@onready var infinite = $infinite
@onready var outline_lg = $"outline-lg"
@onready var anim_player = get_parent().get_node("AnimationPlayer")

var mode = 'ready'

func show_reveal() -> void:
	mode = 'reveal'
	anim_player.play("reveal")

func show_result() -> void:
	mode = "result"
	loading_text.visible = false
	outline_red.visible = false
	infinite.visible = true
	outline_lg.modulate = Color(1,1,1,1)
	anim_player.play("showResult")

var _loading_id: int = 0
func show_loading() -> void:
	_loading_id += 1
	var current_id = _loading_id

	mode = "loading"
	anim_player.play("clickAnim")
	await anim_player.animation_finished
	if current_id != _loading_id: return
	
	anim_player.play("rotate")
	await get_tree().create_timer(5).timeout
	if current_id != _loading_id: return
	
	anim_player.stop()
	if mode == "loading":
		self.show_result()
	
	
func reset() -> void:
	_loading_id += 1

	mode="ready"
	anim_player.play("RESET")
	start_text.visible = true
	loading_text.visible = false
	outline_red.visible = false
	infinite.visible = false
	get_parent().disabled = false
	
