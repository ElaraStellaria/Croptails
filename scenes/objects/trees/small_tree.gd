extends Sprite2D

@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_component: DamageComponent = $DamageComponent

func _ready() -> void:
	hurt_component.hurt.connect(on_hurt)
	damage_component.mix_damage_reached.connect(mix_damage_reached)
	
func on_hurt(hit_damage : int) -> void:
	damage_component.apple_damage(hit_damage)
	
func mix_damage_reached() -> void:
	print("mix damage reahed")
	queue_free()
