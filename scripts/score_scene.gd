extends Control


func _ready() -> void:
	pass

func show_score() -> void:
	self.show()
	get_tree().paused = true
