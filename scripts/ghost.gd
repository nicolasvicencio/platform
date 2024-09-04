extends Sprite2D
@onready var ghost: Sprite2D = $"."

func _ready() -> void:
	ghosting()

func _process(delta: float) -> void:
	var input_axis = Input.get_axis("move_left", "move_right")
	if input_axis < 0 :
		ghost.flip_h = true
	if input_axis > 0 :
		ghost.flip_h = false

func set_properties(tx_position, tx_scale):
	position = tx_position
	scale = tx_scale
	
func ghosting():
	var tween = create_tween()
	tween.tween_property(self, 'self_modulate', Color(1,1,1,0), 0.75)
	await tween.finished
	
	queue_free()
