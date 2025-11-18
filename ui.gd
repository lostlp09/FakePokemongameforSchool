extends Node

@onready var text1 = $"attack 1/button1 text"
@onready var text2 = $"attack 2/button2 text"
@onready var text3 = $"attack 3/button3 text"
@onready var icon1 = $"attack 1/button1 icons"
@onready var icon2 = $"attack 2/button2 icons"
@onready var icon3 = $"attack 3/button3 icons"
@onready var current_attacker = $"..".current_attacker
var texts : Array = [text1, text2, text3]
var icons : Array = [icon1, icon2, icon3]
func _ready():
	print(current_attacker)
#@onready var elements : Dictionary = {"icon1" : current_attacker._attack1_element, "icon2" : current_attacker._attack2_element, "icon3" : current_attacker._attack3_element}
#func _process(delta)->void:
#	for icon in icons:
#		for element in elements:
#			match element:
#				"neutral" : 0
#				"fire" : 1
#				"water" : 2
#				"ice" : 3
#				"wind" : 4
#				"plant" : 5
			
