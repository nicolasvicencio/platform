extends Node2D
@onready var button_animation: AnimatedSprite2D = $Button/button_animation
@onready var player_collider: CollisionShape2D = $Button/Player_collider/Player_collider
@onready var collision_door_1: CollisionShape2D = $Door/CollisionShape2D
@onready var collision_door_2: CollisionShape2D = $Door2/CollisionShape2D
@onready var door_animation_1: AnimatedSprite2D = $Door/door_animation
@onready var door_animation_2: AnimatedSprite2D = $Door2/door_animation
@onready var timer: Timer = $Timer

signal button_pressed_signal

func _on_player_collider_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.name == "Player":
		button_pressed_signal.emit()
		$particle_dust.emitting = true
		collision_door_1.set_deferred("disabled", true)
		door_animation_1.play("open")
		collision_door_2.set_deferred("disabled", true)
		door_animation_2.play("open")
		$sfx_door_open.play()
		Input.start_joy_vibration(0,1,1,0.4)
		
		button_animation.play("default")
		player_collider.set_deferred("disabled", true)
		$Button/sfx_button.play()
		timer.start()

func _on_timer_timeout() -> void:
	button_pressed_signal.emit()
	collision_door_1.disabled = false
	door_animation_1.play("close")
	collision_door_2.disabled = false
	door_animation_2.play("close")
	$sfx_door_close.play()
	Input.start_joy_vibration(0,1,1,0.4)
	
		
	button_animation.play("reset")	
	player_collider.disabled = false
		
