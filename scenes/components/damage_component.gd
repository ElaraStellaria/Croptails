class_name DamageComponent
extends Node2D

@export var mix_damage = 1
@export var current_damage = 0

signal mix_damage_reached

func apple_damage(damage: int) -> void:
	current_damage = clamp(current_damage + damage, 0, mix_damage)
	
	if current_damage == mix_damage:
		mix_damage_reached.emit()
	
	
