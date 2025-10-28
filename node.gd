extends Node
func p1_turn()->void:
	print("spieler 1 zieht")
func p2_turn()->void:
	print("spieler 2 zieht")
var event_p1_turn: Callable = p1_turn
var event_p2_turn: Callable = p2_turn
var game_sequence: Array = [p1_turn, p2_turn]
func _ready() ->void:
	var attacks_beispiel = attacks.new()
	var icon = character.new( Callable(attacks_beispiel, "hit"),float(2.3))
func _process(delta) ->void:
	for current_event in game_sequence:
		current_event.call
		
