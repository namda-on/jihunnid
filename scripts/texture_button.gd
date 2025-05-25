extends TextureButton



func _on_pressed() -> void:
	print("i'm clicked")
	get_tree().change_scene_to_file("res://scene/display_2.tscn")
