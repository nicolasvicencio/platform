extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$spike/spike_collision.set_deferred("disabled", true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.name == "Player":
		print("hey")
		await get_tree().create_timer(0.2).timeout
		$spike/spike_collision.set_deferred("disabled", false)
		await get_tree().create_timer(0.5).timeout
		$spike/spike_collision.set_deferred("disabled", true)
		
