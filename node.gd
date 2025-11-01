extends Node
signal attack


#var event_p1_turn: Callable = p1_turn
#var event_p2_turn: Callable = p2_turn
#var game_sequence: Array = [p1_turn, p2_turn]
var Monkey: character = character.new(100, 30, 20, "Monkey")
var Giraffe: character = character.new(150, 20, 0, "Giraffe", true)
var p1: character
var p2: character
var fighting: bool
var turn: int = 1
var which_attack: String

func _ready() ->void:
	p1 = Monkey
	p2 = Giraffe
	fighting = true
	game_sequence()
	#var attacks_beispiel = attacks.new()
	#var icon = character.new( Callable(attacks_beispiel, "hit"),float(2.3))
#func _process(delta) ->void:
	
		
func _input(attack)->void:
	if Input.is_action_just_pressed("first attack"):
		which_attack = "first attack"
		attack.emit()
	if Input.is_action_just_pressed("second attack"):
		which_attack = "second attack"
		attack.emit()
		
	
func game_sequence()->void:
	await get_tree().process_frame
	if p1.hp <= 0:
		fighting = false
		print(p2.Name, "won")
	if p2.hp <= 0:
		fighting = false
		print(p1.Name, "won")
	if fighting:
		if turn == 1:
			p1_turn()
			
		if turn == 2:
			p2_turn()
			

	
	

func p1_turn()->void:
	print("spieler 1 zieht")
	await attack 
	if which_attack == "first attack":
		p1.attack1(p2)
	if which_attack == "second_attack":
		p1.attack2(p2)	
	turn = 2
	game_sequence()
	 
func p2_turn()->void:
	print("spieler 2 zieht")
	await attack
	if which_attack == "first attack":
		p2.attack1(p1)
	if which_attack == "second_attack":
		p2.attack2(p1)	
	turn = 1
	game_sequence()
		
