extends Sprite2D

@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_component: DamageComponent = $DamageComponent

var log_scene = preload("res://scenes/objects/trees/log.tscn")

func _ready() -> void:
	hurt_component.hurt.connect(on_hurt)
	damage_component.mix_damage_reached.connect(mix_damage_reached)
	
func on_hurt(hit_damage: int) -> void:
	damage_component.apple_damage(hit_damage)

	material.set_shader_parameter("shake_intensity", 1.0)
	material.set_shader_parameter("shake_speed", 20.0)

	await get_tree().create_timer(1.0).timeout

	material.set_shader_parameter("shake_intensity", 0.0)

	
func mix_damage_reached() -> void:
	call_deferred("add_log_scene")
	print("mix damage reahed")
	queue_free()

func add_log_scene() -> void:
	var log_instanca = log_scene.instantiate() as Node2D
	log_instanca.global_position = global_position
	get_parent().add_child(log_instanca)
