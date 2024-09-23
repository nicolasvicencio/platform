extends Camera2D
@onready var player: CharacterBody2D = $"../Player"
var SCREEN_SIZE = Vector2(460,260)
var current_screen 
@onready var camera_follow: Camera2D = $"../Player/Camera_follow"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.camera_mode == 0:
		enabled = true
		camera_follow.enabled = false
		camera_panning()
	else:
		camera_follow.enabled = true
		enabled = false

func camera_panning():
	position = player.position
	var x = floor(position.x / 450) * 450
	var y = floor(position.y /250) * 250
	position = Vector2(x, y)


	
