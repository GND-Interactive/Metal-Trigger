extends Node2D

@onready var players: Node2D = $Players
@onready var spawn: Node2D = $Spawn
@export var player_scene_1 = preload("res://scenes/players/Player-1.tscn")
@export var player_scene_2= preload("res://scenes/players/Player-2.tscn")
@onready var borders: Node2D = $borders
@onready var enemies: Node2D = $Enemies
@onready var health_bars: Control = $CanvasLayer/HealthBarPlayer
@onready var music: AudioStreamPlayer2D = $music
@onready var lobbytimer: Timer = $lobbytimer

var player_scenes = [player_scene_1, player_scene_2]

const BOSS = preload("res://scenes/boss.tscn")

const ENEMY_WAVE_1 = preload("res://scenes/levels/enemy-wave-1.tscn")

func _ready() -> void:
	for i in Game.players.size():
		var player=Game.players[i]
		var player_inst= player_scenes[i].instantiate()
		if i == 0:
			player_inst.color = Color(0,0,1)
		else:
			player_inst.color = Color(1,0,0)
		players.add_child(player_inst)
		player_inst.setup(player)
		player_inst.global_position= spawn.get_child(i).global_position
	music.play()
	lobbytimer.start()

## Funcion Process
##
## Corroboramos vida de cada jugador para actualizar la informacion
func _process(delta: float) -> void:
	pass

@rpc("any_peer", "call_local", "reliable")
func _on_lobbytimer_timeout() -> void:
	Lobby.go_to_menu()
