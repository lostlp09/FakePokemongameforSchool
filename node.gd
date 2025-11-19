extends Node
signal attack
signal attacked 
signal button_1_pressed

#Variablen
var p1: Array
var p2: Array
var fighting: bool
var turn: int = 1
var which_attack: String
var poison_damage: float = 0.05
var burn_damage: int = 5
var current_player: Array
@export var  current_attacker: character
var attacked_char: character

func _ready() ->void:
	p1 = Character.p1
	p2 = Character.p2
	fighting = true
	game_sequence()

func _on_attack_1_pressed() -> void:
	which_attack = "first attack"
	attack.emit()

func _on_attack_2_pressed() -> void:
	which_attack = "second attack"
	attack.emit()

func _on_attack_3_pressed() -> void:
	which_attack = "third attack"
	attack.emit()

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("first enemy"):
		attacked_char = p2[0]
		attacked.emit()
	if Input.is_action_just_pressed("second enemy"):
		attacked_char = p2[1]
		attacked.emit()
	if Input.is_action_just_pressed("third enemy"):
		attacked_char = p2[2]
		attacked.emit()

func game_sequence()->void:
	await get_tree().process_frame
	for char_dead in p1:
		if char_dead.hp  <= 0:
			char_dead.alive = false
	for char_dead in p2:
		if char_dead.hp <= 0:
			char_dead.alive = false
	print(p1)
	if p1[0].alive and p1[1].alive and p1[2].alive == false:
		fighting = false
		print("p2 won")
	if p2[0].alive and p2[1].alive and p2[2].alive == false:
		fighting = false
		print("p1 won")
	if fighting:
		if turn == 1:
			current_player = p1
			p1_turn()
			
		if turn == 2:
			current_player = p2
			p2_turn()

func p1_turn()->void:     
	for x in p1:
		current_attacker = x
		await attack 
		await attacked
		match which_attack:
			"first attack":
				x.attack1(attacked_char)
			"second attack":
				x.attack2(attacked_char)
			"third attack":
				x.attack3(attacked_char)
	for x in p2:
		if x.poisoned:
			x.hp -= poison_damage * x.maxhp
	for x in p2:
		if x.burned:
			x.hp -= burn_damage
	turn = 2
	game_sequence()
	 
func p2_turn()->void:
	for x in p2:
		current_attacker = x
		await attack 
		await attacked
		match which_attack:
			"first attack":
				x.attack1(attacked_char)
			"second attack":
				x.attack2(attacked_char)
			"third attack":
				x.attack3(attacked_char)
	for x in p1:
		if x.poisoned:
			print(x)
			x.hp -= poison_damage * x.maxhp
	for x in p1:
		if x.burned:
			x.hp -= burn_damage
	turn = 1
	game_sequence()
