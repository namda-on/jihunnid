extends Node2D

@onready var texture_button = $"TextureButton"
@onready var img = $"TextureButton/img"

var drag_start_position = Vector2.ZERO
var is_dragging = false
const DRAG_THRESHOLD_X = 400  # 드래그 거리 임계값 (X축 기준)
var scene_changed = false

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			is_dragging = true
			scene_changed = false
			drag_start_position = event.position
		else:
			is_dragging = false
			var delta_x = event.position.x - drag_start_position.x
			if abs(delta_x) < DRAG_THRESHOLD_X:
				if texture_button.get_global_rect().has_point(event.position):
					_on_texture_button_pressed()

	elif event is InputEventScreenDrag and is_dragging and not scene_changed:
		var delta_x = event.position.x - drag_start_position.x

		if abs(delta_x) > DRAG_THRESHOLD_X:
			scene_changed = true
			img.reset()

func _on_texture_button_pressed():
	texture_button._on_pressed()
