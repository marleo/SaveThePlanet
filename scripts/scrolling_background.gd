extends Node

export(float) var scroll_speed = 0.4;

func _ready() -> void:
	self.material.set_shader_param("scroll_speed", scroll_speed);
