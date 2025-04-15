extends CharacterBody3D

var current_cart = null
var speed = 12 #пока хз почему но больше 12 нельзя ставить, скорее всего точка навигации слишком близко определяется

@onready var nav = $NavigationAgent3D
@onready var camera = $"../Camera3D"

func _ready() -> void:
	var current_cart = camera.game_cart[0]
	var next_cart = camera.get_next_cart(current_cart,8)
	nav.set_target_position(next_cart.global_transform.origin)
	
func _physics_process(delta: float) -> void:
	if nav.is_navigation_finished():
		return
	
	var next_position = nav.get_next_path_position()
	var dir = (next_position - global_transform.origin).normalized()
	velocity = dir * speed
	move_and_slide()
