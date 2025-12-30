extends Node
signal attack
signal attacked 
signal button_1_pressed
signal turn_switch

#Variablen
var p1: Array
var p2: Array
var fighting: bool
var turn: int = 1
var which_attack: String
var poison_damage: float = 0.05
var burn_damage: int = 5
var current_player: Array
var passive_player : Array
@export var  current_attacker: character
var attacked_char: character
var pvp: bool = false

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
		if passive_player[0]:
			attacked_char = passive_player[0]
		attacked.emit()
	if Input.is_action_just_pressed("second enemy"):
		if passive_player[1]:
			attacked_char = passive_player[1]
		attacked.emit()
	if Input.is_action_just_pressed("third enemy"):
		if passive_player[2]:
			attacked_char = passive_player[2]
		attacked.emit()

func game_sequence()->void:
	await get_tree().process_frame
	for char_dead in p1:
		if char_dead:
			if char_dead.hp  <= 0:
				char_dead.alive = false
				char_dead.queue_free()
				await get_tree().process_frame
	for char_dead in p2:
		if char_dead:
			if char_dead.hp <= 0:
				char_dead.alive = false
				char_dead.queue_free()
				await get_tree().process_frame

	if not p1[0] and not p1[1] and not p1[2]:
		fighting = false
		print("p2 won")
	if not p2[0] and not p2[1] and not p2[2]:
		fighting = false
		print("p1 won")
	if fighting:
		if turn == 1:
			turn_switch.emit()
			current_player = p1
			passive_player = p2
			p1_turn()
		if turn == 2:
			turn_switch.emit()
			current_player = p2
			passive_player = p1
			p2_turn()

func p1_turn()->void:     
	for x in p1:
		if x:
			current_attacker = x
			await attack 
			await attacked
			while not attacked_char.hp > 0: 
				await attacked
			match which_attack:
				"first attack":
					x.attack1(attacked_char)
				"second attack":
					x.attack2(attacked_char)
				"third attack":
					x.attack3(attacked_char)
	for x in p2:
		if x:
			if x.poisoned:
				x.hp -= poison_damage * x.maxhp
	for x in p2:
		if x:
			if x.burned:
				x.hp -= burn_damage
	for x in p2:
		if x and x.hp < 0:
			x.hp = 0
	turn = 2
	game_sequence()
	 
func p2_turn()->void:
	if pvp:
		print("p2_turn")
		for x in p2:
			current_attacker = x
			await attack 
			await attacked
			while not attacked_char: 
				await attacked
			match which_attack:
				"first attack":
					x.attack1(attacked_char)
				"second attack":
					x.attack2(attacked_char)
				"third attack":
					x.attack3(attacked_char)
	else:
		for x in p2:
			current_attacker = x
			var check = randi_range(0, 2)
			while not p1[check]:
				check = randi_range(0, 2)
			match randi_range(1, 3):
				1: x.attack1(p1[check])
				2: x.attack2(p1[check])
				3: x.attack3(p1[check])
			
	for x in p1:
		if x and x.poisoned:
			x.hp -= poison_damage * x.maxhp
	for x in p1:
		if x and x.burned:
			x.hp -= burn_damage
	for x in p1:
		if x and x.hp < 0:
			x.hp = 0
	turn = 1
	game_sequence()
