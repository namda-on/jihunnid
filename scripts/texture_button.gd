extends TextureButton

@onready var anim_player = $AnimationPlayer
@onready var loading_text = $img/loading
@onready var outline_red = $"img/outline-red"
@onready var infinite = $img/infinite

func _on_pressed() -> void:
	print("i'm clicked")
	disabled = true  # 중복 클릭 방지
	anim_player.play("clickAnim")  # 원하는 애니메이션 이름으로 변경


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "clickAnim":
		anim_player.play("rotate")
		await get_tree().create_timer(3).timeout	
		anim_player.stop()	
		switchDisplay()
		

func switchDisplay() -> void:
	print("switch Scene")
	loading_text.visible = false
	outline_red.visible = false
	infinite.visible = true
	anim_player.play("showResult")	
	
	
	
