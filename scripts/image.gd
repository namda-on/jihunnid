extends Node

@onready var start_text = $start
@onready var loading_text = $loading

@onready var outline_red = $"outline-red"
@onready var outline_lg = $"outline-lg"
@onready var outline_yello_lg = $"outline-yellog-lg"
@onready var outline_yello_sm = $"outline-yellog-sm"



@onready var infinite = $infinite
@onready var anim_player = get_parent().get_node("AnimationPlayer")
@onready var number_label = $Label
@onready var simulation_completed = $"simluation-completed"

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
		self.show_simulate()
	
func show_match() -> void:
	anim_player.play("match")
	await anim_player.animation_finished
	await get_tree().create_timer(3).timeout
	
	self.show_result()
	
var current_value: float = 0
var tween: Tween
var tween2: Tween
var rotateDegree: float = 0
var rotation_speed = 360.0  # 초당 360도 (1초에 1회전)

func show_simulate() -> void:
	mode = "simulate"	
	outline_lg.visible = true
	outline_lg.modulate = Color(1,1,1,1)
	anim_player.play("simulation")
	await anim_player.animation_finished
	await get_tree().create_timer(0.5).timeout
	
	if tween:
		tween.kill()

	rotateDegree = 0
	current_value = 0
	number_label.text = "0"
	tween = create_tween()
	tween.tween_property(self, "current_value", 1000, 5.0)\
		.set_trans(Tween.TRANS_CUBIC)\
		.set_ease(Tween.EASE_OUT)

	tween.connect("finished", Callable(self, "_on_simulate_tween_finished"))

func _process(delta):
	if mode == "simulate":
		number_label.text = str(int(round(current_value)))
		rotateDegree += rotation_speed * delta
		rotateDegree = fmod(rotateDegree, 360)  # 0~360도 범위 유지 (선택사항)
		outline_yello_sm.rotation_degrees = rotateDegree


func _on_simulate_tween_finished():
	current_value = 1000
	number_label.text = "1000"
	await get_tree().create_timer(3).timeout
	
	self.show_match()
	
	number_label.visible = false
func reset() -> void:
	_loading_id += 1
	if tween:
		tween.kill()


	current_value = 0
	number_label.text = "0"
	mode="ready"
	anim_player.play("RESET")
	number_label.visible = false
	start_text.visible = true
	loading_text.visible = false
	outline_red.visible = false
	infinite.visible = false
	simulation_completed.visible = false
	outline_yello_lg.visible = false
	outline_yello_sm.visible = false
	get_parent().disabled = false
	
