extends Area2D

signal body_entered_recover_jump

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.name == "Player":
		body_entered_recover_jump.emit()
		$CPUParticles2D.emitting = true
		$sfx_pick.play()
		$AnimatedSprite2D.play("off")
		$CollisionShape2D.set_deferred("disabled", true)
		await get_tree().create_timer(3).timeout
		$AnimatedSprite2D.play("on")
		$CollisionShape2D.set_deferred("disabled", false)
		
		
