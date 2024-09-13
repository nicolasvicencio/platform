extends AnimatableBody2D
@onready var timer: Timer = $Timer
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var particles_dust: CPUParticles2D = $particles_dust
@onready var particles_explosion: CPUParticles2D = $particles_explosion
@onready var timer_redraw: Timer = $timer_redraw
@onready var collider: CollisionShape2D = $Area2D/CollisionShape2D

var time = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += 1
	sprite_2d.position += Vector2(0, sin(time) * 2)
	particles_dust.emitting = true 

func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.name == "Player":
		timer.start()
		$AudioStreamPlayer.play()
		Input.start_joy_vibration(0,0.5,0.5,0.4)
		set_process(true)

func _on_timer_timeout() -> void:
	$AudioStreamPlayer.stop()
	particles_explosion.emitting = true
	var tween = create_tween()
	tween.tween_property(self, "modulate:a",0, 0.3)
	$CollisionShape2D.disabled = true
	collider.disabled = true
	set_process(false)
	timer_redraw.start()
	
func _on_timer_redraw_timeout() -> void:
	$CollisionShape2D.disabled = false
	collider.disabled = false
	particles_dust.emitting = false
	sprite_2d.position += Vector2(0, 0)
	var tween = create_tween()
	tween.tween_property(self, "modulate:a",1, 0.3)
