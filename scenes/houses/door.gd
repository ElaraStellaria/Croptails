extends StaticBody2D


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var intractable_components: IntractableComponent = $IntractableComponents

func _ready() -> void:
	intractable_components.intractable_activated.connect(on_intractable_activated)
	intractable_components.intractable_deactivated.connect(on_intractable_deactivated)
	collision_layer = 1

func on_intractable_activated() -> void:
	animated_sprite_2d.play("open door")
	print("Activated")
	collision_layer = 2

func on_intractable_deactivated() -> void:
	animated_sprite_2d.play("close door")
	print("Deactivated")
	collision_layer = 1
