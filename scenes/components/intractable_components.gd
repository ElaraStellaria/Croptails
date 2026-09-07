class_name IntractableComponent
extends Area2D

signal intractable_activated
signal intractable_deactivated



func _on_body_entered(body: Node2D) -> void:
	intractable_activated.emit()


func _on_body_exited(body: Node2D) -> void:
	intractable_deactivated.emit()
