extends Camera2D
@onready var player: CharacterBody2D = $"../Player"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.camera_mode == 0:
		camera_panning()
	else:
		camera_follow()

func camera_panning():
	position = player.position
	var x = floor(position.x / 450) * 450
	var y = floor(position.y /250) * 250
	position = Vector2(x, y)

func camera_follow():
	anchor_mode = Camera2D.ANCHOR_MODE_DRAG_CENTER
	position = player.position
	
