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
	if img.mode == "ready":
		print("reveal")
		img.show_reveal()
	elif img.mode == "reveal":
		print("clickAnim")
		img.show_loading()
