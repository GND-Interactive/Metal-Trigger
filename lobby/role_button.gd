extends Button

@onready var role_button: Button = %RoleButton
@onready var player_texture: TextureRect = %PlayerTexture

# Imágenes de personajes
var hombre_azul_img: Texture = preload("res://assets/img/Hombre_Azul_Select.jpg")
var mujer_roja_img: Texture = preload("res://assets/img/Mujer_Roja_Select.jpg") # <-- usa imagen distinta

func _process(delta: float) -> void:
	var role = role_button.text  # obtener el texto actualizado en cada frame

	if role == "Spark Boy" and player_texture.texture != hombre_azul_img:
		player_texture.texture = hombre_azul_img
	elif role == "Flare Girl" and player_texture.texture != mujer_roja_img:
		player_texture.texture = mujer_roja_img
