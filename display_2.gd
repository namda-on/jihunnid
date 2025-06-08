extends Node2D

var drag_start_position = Vector2.ZERO
var is_dragging = false
const DRAG_THRESHOLD_X = 200  # 드래그 거리 임계값 (X축 기준)
var scene_changed = false

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			is_dragging = true
			scene_changed = false
			drag_start_position = event.position
		else:
			is_dragging = false

	elif event is InputEventScreenDrag and is_dragging and not scene_changed:
		var delta_x = event.position.x - drag_start_position.x

		if abs(delta_x) > DRAG_THRESHOLD_X:
			scene_changed = true
			get_tree().change_scene_to_file("res://scene/display_1.tscn")
