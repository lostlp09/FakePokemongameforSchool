extends Node
var testCharakterer = character.new(1,2,4,3,"yo").optional1
@onready var label = $"../Kampf/player_turn"
@onready var attack1_button = $"../Kampf/attack 1"
@onready var attack2_button = $"../Kampf/attack 2"
@onready var attack3_button = $"../Kampf/attack 3"

func _process(delta) -> void:
	
	label.text = "player " + var_to_str($"../Kampf".turn) + " turn"
	if $"../Kampf".turn == 1:
		attack1_button.text = "attack 1:
		" + var_to_str(Character.p1.damage1) + " damage"
		attack2_button.text = "attack 2:
		" + var_to_str(Character.p1.damage2) + " damage"
		attack3_button.text = "attack 3:
		" + var_to_str(Character.p1.damage3) + " damage"
	if $"../Kampf".turn == 2:
		attack1_button.text = "attack 1:
		" + var_to_str(Character.p2.damage1) + " damage"
		attack2_button.text = "attack 2:
		" + var_to_str(Character.p2.damage2) + " damage"
		attack3_button.text = "attack 3:
		" + var_to_str(Character.p2.damage3) + " damage"
		
		
func _ready() -> void:

	var initdings = testCharakterer
	print(initdings)
	#var init_dic = cha.optional1
