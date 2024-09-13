extends AnimatableBody2D

enum platform_state {OPEN, CLOSE}
@export var state: platform_state
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	match state:
		platform_state.OPEN:
			close_platform()
		platform_state.CLOSE:
			open_platform()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
			
func close_platform():
	animated_sprite_2d.play("close")
	collision_shape_2d.set_deferred("disabled", true)
	await get_tree().create_timer(3).timeout
	$AudioStreamPlayer2D.play()
	open_platform()
	
func open_platform():
	collision_shape_2d.set_deferred("disabled", false)
	animated_sprite_2d.play("open")
	await get_tree().create_timer(3).timeout
	$AudioStreamPlayer2D.play()
	close_platform()
