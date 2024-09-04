extends PathFollow2D

const SPEED = 0.2
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	loop_movement(delta)

func loop_movement(delta):
	progress_ratio += SPEED * delta
	#collision_shape_2d.position += SPEED * delta
