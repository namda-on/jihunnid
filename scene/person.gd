extends Sprite2D


func _ready():
	var person = OS.get_environment("PERSON")
	var texture_path = ""

	match person:
		"jihunnid":
			texture_path = "res://resources/dasom.png"
		"dasom":
			texture_path = "res://resources/jihunnid.png"
		_:
			texture_path = "res://resources/jihunnid.png"

	if texture_path != "":
		texture = load(texture_path)
		print("Loaded texture for mode:", texture_path, person)
