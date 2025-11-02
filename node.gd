extends Node
signal attack


#var event_p1_turn: Callable = p1_turn
#var event_p2_turn: Callable = p2_turn
#var game_sequence: Array = [p1_turn, p2_turn]
var Monkey: character = character.new(100, 30, 20, 10, "Monkey", {})
var Giraffe: character = character.new(150, 20, 0, 30, "Giraffe", {"poison2" = true})
var Gambler: character = character.new(500, 0, 0, 20, "Gambler", {"gamble3" = true})
var p1: character
var p2: character
var fighting: bool
var turn: int = 1
var which_attack: String
var poison_damage: int = 5

func _ready() ->void:
	p1 = Monkey
	p2 = Gambler
	fighting = true
	game_sequence()
	#var attacks_beispiel = attacks.new()
	#var icon = character.new( Callable(attacks_beispiel, "hit"),float(2.3))
#func _process(delta) ->void:
	
		
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
		print(p2.Name, " won")
	if p2.hp <= 0:
		fighting = false
		print(p1.Name, " won")
	if fighting:
		if turn == 1:
			p1_turn()
			
		if turn == 2:
			p2_turn()
			
		if p1.poisoned:
			p1.hp -= poison_damage
			print(p1.Name, " takes ", poison_damage, " damage through poison and has now ", p1.hp, " hp left")
			
		if p2.poisoned:
			p2.hp -= poison_damage
			print(p2.Name, " takes ", poison_damage, " damage through poison and has now ", p2.hp, " hp left")		

	
	

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
		
