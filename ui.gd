extends Node

@onready var text1 = $"attack 1/button1 text"
@onready var text2 = $"attack 2/button2 text"
@onready var text3 = $"attack 3/button3 text"

var current_attacker
var elements
var texts : Array
var icons : Array
func _ready():
	icons = [$"attack 1/button1 icons", $"attack 2/button2 icons", $"attack 3/button3 icons"]
	while not $"..".current_attacker:
		await get_tree().process_frame
func _process(delta)->void:
	text1.text = "attack 1"
	text2.text = "attack 2"
	text3.text = "attack 3"
	if elements:
		current_attacker = $"..".current_attacker
		elements = [current_attacker.n_attack1_element,
	 	current_attacker.n_attack2_element,
	 	current_attacker.n_attack3_element]
		for i in range(0,3):
			var icon = icons[i]
			var element = elements[i]
			var x
			match element:
				"neutral" : x = 0
				"fire" : x = 1
				"water" : x = 2
				"ice" : x = 3
				"wind" : x = 4
				"plant" : x = 5
			icon.frame = x
		
		
