extends Control

@onready var timer: Timer = $Timer
@onready var sound: AudioStreamPlayer = $AudioStreamPlayer

const LEVEL_2_SCENE = preload("res://scenes/levels/level-2.tscn")

func _ready() -> void:
	timer.wait_time = 5.0
	timer.one_shot = true
	timer.process_mode = Node.PROCESS_MODE_ALWAYS

func show_score() -> void:
	sound.play()  # Reproducir sonido ANTES de pausar 
	self.show()
	timer.start()
	#get_tree().paused = true

func _on_timer_timeout() -> void:
	print("Timer completado!")
	#get_tree().paused = false
	
	# Solo el servidor ejecuta y sincroniza con todos los clientes
	if multiplayer.is_server():
		print("Servidor iniciando cambio de nivel...")
		_change_to_level_2.rpc()
	else:
		print("Cliente esperando cambio de nivel del servidor...")

@rpc("call_local", "reliable")
func _change_to_level_2():
	get_tree().change_scene_to_packed(LEVEL_2_SCENE)
