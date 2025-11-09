extends Node

@onready var label_p1hp = $"../Kampf/player1_hp"
@onready var label_p2hp = $"../Kampf/player2_hp"
@onready var label_turn = $"../Kampf/player_turn"
@onready var attack1_button = $"../Kampf/attack 1"
@onready var attack2_button = $"../Kampf/attack 2"
@onready var attack3_button = $"../Kampf/attack 3"
var label_pos1 := Vector2(40,600)
var label_pos2 := Vector2(920,600)
var init_dic: Dictionary
var effect_number
var effect_name
@onready var attack_buttons :Dictionary = {"1" : $"../Kampf/attack 1", "2" : $"../Kampf/attack 2", "3" : $"../Kampf/attack 3"}

func _process(delta) -> void:
	init_dic = $"../Kampf".current_attacker.optional_
	label_turn.text = "player " + var_to_str($"../Kampf".turn) + "(" + var_to_str($"../Kampf".current_attacker.Name)+ ")" +" turn"
	label_p1hp.text = "player 1:
	" + Character.p1[0].Name + "hp: " + var_to_str(Character.p1[0].hp) + "        " + Character.p1[1].Name + "hp: " + var_to_str(Character.p1[1].hp) + "        " + Character.p1[2].Name + "hp: " + var_to_str(Character.p1[2].hp)
	label_p2hp.text = "player 2:
	" + Character.p1[0].Name + "hp: " + var_to_str(Character.p1[0].hp) + "        " + Character.p1[1].Name + "hp: " + var_to_str(Character.p1[1].hp) + "        " + Character.p1[2].Name + "hp: " + var_to_str(Character.p1[2].hp)
	attack1_button.text = "attack 1:
	" + var_to_str($"../Kampf".current_attacker.damage1) + " damage
	"
	attack2_button.text = "attack 2:
	" + var_to_str($"../Kampf".current_attacker.damage2) + " damage
	"
	attack3_button.text = "attack 3:
	" + var_to_str($"../Kampf".current_attacker.damage3) + " damage
	"
	for key in init_dic:
		if init_dic[key]:
			print(init_dic)
			effect_number = key.substr(key.length() - 1, 1)
			effect_name = key.substr(0, key.length() - 1)
			attack_buttons[effect_number].text += effect_name + "
			"
	if $"../Kampf".turn == 1:
		label_p1hp.position = label_pos1
		label_p2hp.position = label_pos2

	if $"../Kampf".turn == 2:
		label_p1hp.position = label_pos2
		label_p2hp.position = label_pos1
