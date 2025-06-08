extends TextureButton

@onready var anim_player = $AnimationPlayer
@onready var loading_text = $img/loading
@onready var outline_red = $"img/outline-red"
@onready var infinite = $img/infinite
@onready var img = $img

func _on_pressed() -> void:
	disabled = true
	anim_player.play("clickAnim")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "clickAnim":
		anim_player.play("rotate")
		await get_tree().create_timer(3).timeout
		anim_player.stop()
		img.show_result()
