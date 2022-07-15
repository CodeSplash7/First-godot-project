extends Area2D

onready var sprite = get_node("sprite")
onready var collision = get_node("collision")
onready var screensize = get_viewport_rect().size
onready var extents = Vector2(collision.get_shape().get_extents())
var speed = 400
var vel : Vector2
var pos : Vector2

func _ready():
	set_process(true)
	pos = Vector2(screensize.x/2, screensize.y/2)
	
func _process(delta):
	move()
	pos += vel * delta
	dontGetOffScreen()
	set_position(pos)
	
func move():
	var input = Vector2(0,0)
	input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	vel = input.normalized() * speed
	
func dontGetOffScreen():
	pos.x = clamp(pos.x, extents.x, screensize.x - extents.x)
	pos.y = clamp(pos.y, extents.y, screensize.y - extents.y)
