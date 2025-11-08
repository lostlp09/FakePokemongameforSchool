extends Node
signal attack
signal button_1_pressed


#var event_p1_turn: Callable = p1_turn
#var event_p2_turn: Callable = p2_turn
#var game_sequence: Array = [p1_turn, p2_turn]
var Monkey: character = character.new(100, 30, 20, 10, "Monkey", {})
var Giraffe: character = character.new(150, 20, 0, 30, "Giraffe", {"poison2" = true})
var Gambler: character = character.new(500, 0, 0, 20, "Gambler", {"gamble3" = true})
var shield_test: character = character.new(1000, 0, 0, 0, "shield_test", {"shield1" = 500, "shield2" = 500})
var p1: character
var p2: character
var fighting: bool
var turn: int = 1
var which_attack: String
var poison_damage: float = 0.05
var burn_damage: int = 5
var current_player: character

func _ready() ->void:
	p1 = Character.p1
	p2 = Character.p2
	fighting = true
	game_sequence()
	#var attacks_beispiel = attacks.new()
	#var icon = character.new( Callable(attacks_beispiel, "hit"),float(2.3))
func _process(delta) ->void:
	$"attack1 label".text 
	
		
func _input(_attack)->void:
	if Input.is_action_just_pressed("first attack"):
		which_attack = "first attack"
		attack.emit()
	if Input.is_action_just_pressed("second attack"):
		which_attack = "second attack"
		attack.emit()
	if Input.is_action_just_pressed("third attack"):
		which_attack = "third attack"
		attack.emit()
		
		
	
func game_sequence()->void:
	await get_tree().process_frame
	if p1.hp <= 0:
		fighting = false
		p1.hp = 0
		print(p2.Name, " won")
	if p2.hp <= 0:
		fighting = false
		p2.hp = 0
		print(p1.Name, " won")
	if fighting:
		if turn == 1:
			current_player = p1
			p1_turn()
			
		if turn == 2:
			current_player = p2
			p2_turn()
			
		if p1.poisoned:
			p1.hp -= poison_damage * p1.maxhp
			print(p1.Name, " takes ", poison_damage * p1.maxhp, " damage through poison and has now ", p1.hp, " hp left")
		if p1.burned:
			p1.hp -= burn_damage
			print(p1.Name, " takes ", burn_damage, " damage through burn")	
		if p2.poisoned:
			p2.hp -= poison_damage * p1.maxhp
			print(p2.Name, " takes ", poison_damage * p1.maxhp, " damage through poison and has now ", p2.hp, " hp left")		
		
	
	

func p1_turn()->void:
	print("spieler 1 zieht")
	await attack 
	if which_attack == "first attack":
		p1.attack1(p2)
	if which_attack == "second attack":
		p1.attack2(p2)	
	if which_attack == "third attack":
		p1.attack3(p2)	
	turn = 2
	game_sequence()
	 
func p2_turn()->void:
	print("spieler 2 zieht")
	await attack
	if which_attack == "first attack":
		p2.attack1(p1)
	if which_attack == "second attack":
		p2.attack2(p1)	
	if which_attack == "third attack":
		p2.attack3(p1)	
	turn = 1
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
