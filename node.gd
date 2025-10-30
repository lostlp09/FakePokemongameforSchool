extends Node

signal keypress

#funktionen
func p1_turn()->void:
	if fighting ==true:
		print("spieler 1 zieht")
		await keypress
		p1.attack(p2)
		print(p2.Name, " has ", p2.hp, " hp left ")
		playerswitch()	
func p2_turn()->void:
	if fighting == true:
		print("spieler 2 zieht")
		await keypress
		p2.attack(p1)
		print(p1.Name, " has ", p1.hp, " hp left ")
		playerswitch()
#variablen
var game_sequence: Array = [p1_turn, p2_turn]
#var attacks_beispiel = attacks.new()
var monkey = character.new(100, 30, "monkey")
var girrafe = character.new(150, 20, "girrafe")
var p1 = monkey
var p2 = girrafe
var fighting: bool = true
var current_event: int = 0 
func _ready() ->void:
	playerswitch()
	#var attacks_beispiel = attacks.new()
	#var p1 = character.new()
	
	
func _process(delta) ->void:
	if p1.hp <= 0:
		fighting = false
	#game_sequence[current_event].call()
	#current_event += 1
	#if current_event > len(game_sequence)-1:
		#current_event = 0
		
func _input(_i):
	if Input.is_action_just_pressed("first attack"):
		keypress.emit()

func playerswitch()->void:
	game_sequence[current_event].call()
	current_event += 1
	if current_event > len(game_sequence)-1:
		current_event = 0
	
