extends Area2D

signal gem_grabbed

func get_collision():
	return get_node("collision")

func _on_gem_area_entered(area):
	if area.get_name() == "player":
		emit_signal("gem_grabbed")
		queue_free()
