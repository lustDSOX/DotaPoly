extends Camera3D

var game_cart = [];

func _ready():
	var angle = $"../NavigationRegion3D/angle1"
	var line = $"../NavigationRegion3D/line_cart_top".get_children()
	game_cart.append(angle)
	game_cart.append_array(line)
	
	angle = $"../NavigationRegion3D/angle2"
	line = $"../NavigationRegion3D/line_cart_right".get_children()
	game_cart.append(angle)
	game_cart.append_array(line)
	
	angle = $"../NavigationRegion3D/angle3"
	line = $"../NavigationRegion3D/line_cart_bot".get_children()
	game_cart.append(angle)
	game_cart.append_array(line)
	
	angle = $"../NavigationRegion3D/angle4"
	line = $"../NavigationRegion3D/line_cart_left".get_children()
	game_cart.append(angle)
	game_cart.append_array(line)
	
func get_next_cart(current_cart:Node,move_at:int):
	var index = game_cart.find(current_cart)
	var next_index = index + move_at
	if next_index > 40:
		next_index -= 40
	return game_cart[next_index]
