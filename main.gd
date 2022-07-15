extends Node

onready var gem = preload("res://gem.tscn")
onready var gem_extents = gem.instance().get_collision().get_shape().get_extents()
onready var gem_container = get_node("gem_container")
onready var screensize = get_viewport().get_texture().get_size()
onready var label = get_node("HUD/label")
var score = 0
var level = 0

func _ready():
	randomize()
	set_process(true)
	
func _process(delta):
	if gem_container.get_child_count() == 0: 
		level += 1
		spawn_gems(level * 10)

func spawn_gems(num):
	for i in range(num):
		var g = gem.instance()
		g.connect("gem_grabbed", self, "_on_gem_grabbed")
		g.set_position(Vector2(rand_range(gem_extents.x, screensize.x - gem_extents.x), rand_range(gem_extents.y, screensize.y - gem_extents.y)))
		gem_container.add_child(g)
		
func _on_gem_grabbed():
	score += 1
	label.set_text("score: " + str(score))
	
