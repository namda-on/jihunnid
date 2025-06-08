extends TextureButton

@onready var anim_player = $AnimationPlayer
@onready var anim_player2 = $AnimationPlayer2
@onready var loading_text = $img/loading
@onready var outline_red = $"img/outline-red"
@onready var infinite = $img/infinite
@onready var img = $img


func _on_pressed() -> void:
	if anim_player.is_playing():
		return
	
	disabled = true
	if img.mode == "ready":
		print("reveal")
		img.show_reveal()
	elif img.mode == "reveal":
		print("clickAnim")
		anim_player.play("clickAnim")
		#anim_player2.play("fade_in")		

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	disabled = false
	if anim_name == "clickAnim":
		anim_player.play("rotate")
		await get_tree().create_timer(10).timeout
		anim_player.stop()
		img.show_result()
